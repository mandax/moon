import * as fs from 'fs';

console.log('Running assets importer');

const rawDir = '../../assets/node_modules/moon-css/example/assets/';
const exportDir = '../../lib/moon/assets/';

const getFiles = (iconType) => fs.readdirSync(`${rawDir}/${iconType}`);
const getContents = (iconType, file) =>
  fs.readFileSync(`${rawDir}/${iconType}/${file}`);

const toCamel = (s) => {
  return s.replace(/([-_][a-z])/gi, ($1) => {
    return $1
      .toUpperCase()
      .replace(/([-_])/gi, '')
      .replace(/([-_])/gi, '');
  });
};

const capitalizeFirstLetter = (string) => {
  return string.charAt(0).toUpperCase() + string.slice(1);
};

const camelToSnakeCase = (str) =>
  str.replace(/[A-Z]/g, (letter) => `_${letter.toLowerCase()}`);

const getModuleName = (s) =>
  capitalizeFirstLetter(toCamel(s))
    .replace('IconLoyalty-0', 'IconLoyalty0')
    .replace('.svg', '');

const propsMap = {
  icon: `
    prop color, :string, values: Moon.colors
    prop background_color, :string, values: Moon.colors
    prop font_size, :string
    `,
  default: `
    prop color, :string, values: Moon.colors
    prop height, :string
    prop width, :string
    prop font_size, :string
    prop vertical_align, :string
    `,
};

const propsMapKeys = {
  icon: ['color', 'background_color', 'font_size'],
  default: ['color', 'height', 'width', 'font_size', 'vertical_align']
}

const writeAssetsMapFile = ({ assetsFolder, iconType, files }) => {
  const newFilePath = `${exportDir}/${assetsFolder}.ex`;

  fs.writeFileSync(
    newFilePath,
    `
defmodule Moon.Assets.${getModuleName(iconType)} do 
  use Moon.StatelessComponent
  alias Moon.Assets.${getModuleName(iconType)}
  
  prop name, :string
  ${propsMap[iconType] || propsMap.default}
  @assets_map %{
    ${files
      .map(
        (i) =>
          `${i
            .replace(/([-_])/gi, '_')
            .toLowerCase()
            .replace(".svg", "")
            .replace(
              `${iconType.substring(0, iconType.length - 1)}_`.toLowerCase(),
              ''
            )}: ${getModuleName(iconType)}.${getModuleName(i)}`
      )
      .join(', ')}
    }
  def icon_name_to_module(icon_name) do 
    @assets_map[:"#{icon_name}"]
  end
  def render(assigns) do 
    ~H"""
    {{ @name && icon_name_to_module(@name) && live_component(@socket, icon_name_to_module(@name), ${(propsMapKeys[iconType] || propsMapKeys.default).map((x:string) => `${x}: @${x}`).join(", ")}) }}
    """
  end
end
`.replace('IconLoyalty-0', 'IconLoyalty0')
  );
};


const createAssetComponentFile = ({ assetsFolder, iconType, file }) => {
  const newFilePath = `${exportDir}/${assetsFolder}/${file
    .replace(/([-_])/gi, '_')
    .toLowerCase()}.ex`;

  const svgMap = {
    icon: `
    <svg class="moon-${iconType}" style={{ get_style(color: @color, background_color: @background_color, font_size: @font_size) }}>
      <use href="/svgs/${assetsFolder}/${file}.svg#item"></use>
    </svg>
    `,
    default: `
    <svg class="moon-${iconType}" style={{ get_style(color: @color, height: @height, width: @width, font_size: @font_size, vertical_align: @vertical_align) }}>
      <use href="/svgs/${assetsFolder}/${file}.svg#item"></use>
    </svg>
    `,
  };

  fs.writeFileSync(
    newFilePath,
    `
defmodule Moon.Assets.${getModuleName(assetsFolder)}.${getModuleName(file)} do 
  use Moon.StatelessComponent
  ${propsMap[iconType] || propsMap.default}
  def render(assigns) do 
    ~H"""
    {{ asset_import @socket, "js/assets/${iconType}" }}
    ${svgMap[iconType] || svgMap.default}
    """
  end
end
`.replace('IconLoyalty-0', 'IconLoyalty0')
  );
};

['crests', 'duotones', 'icons', 'logos', 'patterns'].forEach((assetsFolder) => {
  const files = getFiles(assetsFolder);

  writeAssetsMapFile({
    assetsFolder,
    iconType: assetsFolder.substring(0, assetsFolder.length - 1),
    files,
  });

  files.forEach((file) => {
    createAssetComponentFile({
      assetsFolder,
      iconType: assetsFolder.substring(0, assetsFolder.length - 1),
      file: file.replace('.svg', ''),
    });
  });
});

const assetsDocDir = '../../lib/moon_web/pages/assets/';

const writeAssetsDocumentationPage = (type, pageContent) => {
  fs.writeFileSync(assetsDocDir + type + '_page.ex', pageContent);
};

const generateAssetsDocumentationPageContent = (type, modules) => {
  if (type == 'crests') {
    return `
defmodule MoonWeb.Pages.Assets.CrestsPage do
  use MoonWeb, :live_view

  alias Moon.Components.Inline
  alias Moon.Components.CodePreview

  alias Moon.Assets.Crests
${modules.map((x) => `  alias Crests.${x}`).join('\n')}

  def mount(params, _session, socket) do
    {:ok, assign(socket, theme_name: params["theme_name"] || "sportsbet-dark", active_page: __MODULE__)}
  end

  def render(assigns) do
    ~H"""
    <Inline>
${modules.map((x) => `      <${x} font_size="10rem" />`).join('\n')}
    </Inline>
    <#CodePreview>
      <Inline>
${modules.map((x) => `        <${x} font_size="10rem" />`).join('\n')}
      </Inline>
    </#CodePreview>
    """
  end
end
    `;
  }

  if (type == 'duotones') {
    return `
defmodule MoonWeb.Pages.Assets.DuotonesPage do
  use MoonWeb, :live_view

  alias Moon.Components.Inline
  alias Moon.Components.CodePreview

  alias Moon.Assets.Duotones
${modules.map((x) => `  alias Duotones.${x}`).join('\n')}

  def mount(params, _session, socket) do
    {:ok, assign(socket, theme_name: params["theme_name"] || "sportsbet-dark", active_page: __MODULE__)}
  end

  def render(assigns) do
    ~H"""
    <Inline>
${modules
  .map((x) => `      <${x} font_size="10rem" color="piccolo-100" />`)
  .join('\n')}
    </Inline>
    <#CodePreview>
      <Inline>
${modules
  .map((x) => `        <${x} font_size="10rem" color="piccolo-100" />`)
  .join('\n')}
      </Inline>
    </#CodePreview>
    """
  end
end
    `;
  }

  if (type == 'icons') {
    return `
defmodule MoonWeb.Pages.Assets.IconsPage do
  use MoonWeb, :live_view

  alias Moon.Components.Inline
  alias Moon.Components.CodePreview

  alias Moon.Assets.Icons
${modules.map((x) => `  alias Icons.${x}`).join('\n')}

  def mount(params, _session, socket) do
    {:ok, assign(socket, theme_name: params["theme_name"] || "sportsbet-dark", active_page: __MODULE__)}
  end

  def render(assigns) do
    ~H"""
    <Inline>
${modules.map((x) => `      <${x} />`).join('\n')}
    </Inline>
    <#CodePreview>
      <Inline>
${modules.map((x) => `        <${x} />`).join('\n')}
      </Inline>
    </#CodePreview>
    """
  end
end
    `;
  }

  if (type == 'logos') {
    return `
defmodule MoonWeb.Pages.Assets.LogosPage do
  use MoonWeb, :live_view

  alias Moon.Components.Inline
  alias Moon.Components.CodePreview

  alias Moon.Assets.Logos
${modules.map((x) => `  alias Logos.${x}`).join('\n')}

  def mount(params, _session, socket) do
    {:ok, assign(socket, theme_name: params["theme_name"] || "sportsbet-dark", active_page: __MODULE__)}
  end

  def render(assigns) do
    ~H"""
    <Inline font_size="10em">
${modules.map((x) => `      <${x} />`).join('\n')}
    </Inline>
    <#CodePreview>
      <Inline font_size="10em">
${modules.map((x) => `        <${x} />`).join('\n')}
      </Inline>
    </#CodePreview>
    """
  end
end
    `;
  }

  if (type == 'patterns') {
    return `
defmodule MoonWeb.Pages.Assets.PatternsPage do
  use MoonWeb, :live_view

  alias Moon.Components.Inline
  alias Moon.Components.CodePreview

  alias Moon.Assets.Patterns
${modules.map((x) => `  alias Patterns.${x}`).join('\n')}

  def mount(params, _session, socket) do
    {:ok, assign(socket, theme_name: params["theme_name"] || "sportsbet-dark", active_page: __MODULE__)}
  end

  def render(assigns) do
    ~H"""
    <Inline font_size="10em">
${modules.map((x) => `      <${x} />`).join('\n')}
    </Inline>
    <#CodePreview>
      <Inline font_size="10em">
${modules.map((x) => `        <${x} />`).join('\n')}
      </Inline>
    </#CodePreview>
    """
  end
end
    `;
  }
};


const generateAssetsDocumentationPage = (type, files) => {
  const modules = files.map((f) => getModuleName(f));
  const pageContent = generateAssetsDocumentationPageContent(type, modules);

  writeAssetsDocumentationPage(type, pageContent);
};

['crests', 'duotones', 'icons', 'logos', 'patterns'].forEach((assetsFolder) => {
  const files = getFiles(assetsFolder);
  generateAssetsDocumentationPage(assetsFolder, files);
});
