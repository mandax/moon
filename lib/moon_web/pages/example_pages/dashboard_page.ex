defmodule MoonWeb.Pages.ExamplePages.DashboardPage do
  use MoonWeb, :live_view

  alias Moon.Assets.Icons.IconMore
  alias Moon.Assets.Icon
  alias Moon.Autolayouts.ButtonsList

  alias Moon.Components.Button
  alias Moon.Components.Chip
  alias Moon.Components.Datepicker
  alias Moon.Components.Divider
  alias Moon.Components.DropdownMenuButton
  alias Moon.Components.DropdownMenuItem
  alias Moon.Components.DropdownMenuItems
  alias Moon.Components.Heading
  alias Moon.Components.IconButton
  alias Moon.Components.Popover
  alias Moon.Components.Switcher

  alias MoonWeb.Pages.ExamplePages.Shared
  alias MoonWeb.Pages.ExamplePages.Components.BarChartWidget
  alias Shared.TopMenu
  alias Shared.LeftMenu

  @colors ~w(
    krillin-100 frieza-100 roshi-100
    raditz-100 chi-chi-100 whis-100
    cell-100 dodoria-100 nappa-100
  )

  @metrics [
    "Total deposits, EUR",
    "Total withdrawals, EUR",
    "Casino NGR, EUR",
    "Sports NGR, EUR",
    "Total NGR, EUR"
  ]

  @widget_names ~w(
    Depositors Winers Losers
    Wages Demographic Geo
    Currency Device\u00a0&\u00a0OS Products
  )

  data colors, :list, default: @colors
  data widget_names, :list, default: @widget_names

  def mount(params, _session, socket) do
    socket =
      assign(socket,
        theme_name: params["theme_name"] || "lab-light",
        active_page: __MODULE__,
        title: "Starter dashboard",
        clicked_filter_name: "",
        tabs: get_tabs(),
        selected_tab: "total",
        saved: true,
        metrics: [],
        widgets: [],
        start_date: Timex.beginning_of_month(Timex.today()),
        end_date: Timex.end_of_month(Timex.today())
      )

    socket =
      if connected?(socket) do
        assign(socket,
          metrics: get_metrics(),
          widgets: get_widgets()
        )
      else
        socket
      end

    {:ok, socket, layout: {MoonWeb.LayoutView, "clean.html"}}
  end

  def render(assigns) do
    ~F"""
    <div class={"#{@theme_name}"}>
      <TopMenu id="top-menu" />

      <div class="flex">
        <LeftMenu id="left-menu" />

        <div class="flex-grow py-6 overflow-x-hidden px-14">
          <div class="flex items-center mb-6 gap-x-4">
            <Heading size={32} class="flex-grow">{@title}</Heading>

            <IconButton icon_name="icon_notification" title="TODO: Notifications" />

            <DropdownMenuButton id="dashboard-menu-button">
              <IconMore />

              <:menu>
                <DropdownMenuItems>
                  <DropdownMenuItem>Edit</DropdownMenuItem>
                  <DropdownMenuItem>Rearrange widget</DropdownMenuItem>
                  <DropdownMenuItem>Duplicate</DropdownMenuItem>
                  <DropdownMenuItem>Share</DropdownMenuItem>
                  <DropdownMenuItem>Delete</DropdownMenuItem>
                </DropdownMenuItems>
              </:menu>
            </DropdownMenuButton>
          </div>

          <div class="flex flex-wrap items-center gap-y-4 gap-x-6">
            <Switcher items={@tabs} selected_item={@selected_tab} click="tab_click" />

            <Divider orientation="vertical" color="beerus-100" height="10" />

            <ButtonsList>
              <!-- TODO: Tweak styles -->
              <Datepicker
                id="filter_datepicker"
                start_date={@start_date}
                end_date={@end_date}
                start_date_field={:start_date}
                end_date_field={:end_date}
                button_class="font-semibold px-3 text-trunks-100 bg-gohan-100"
                on_date_change="update_filter_dates"
              />

              <Popover.Outer>
                <Chip
                  on_click="open_popover"
                  value="platform"
                  right_icon="icon_chevron_down_rounded"
                  class="px-3 text-trunks-100"
                >
                  Platform · All
                </Chip>
                <Popover
                  close="close_popover"
                  placement="under"
                  :if={@clicked_filter_name == "platform"}
                >
                  TODO
                </Popover>
              </Popover.Outer>

              <Popover.Outer>
                <Chip
                  on_click="open_popover"
                  value="brand"
                  right_icon="icon_chevron_down_rounded"
                  class="px-3 text-trunks-100"
                >
                  Brand · 2
                </Chip>
                <Popover
                  close="close_popover"
                  placement="under"
                  :if={@clicked_filter_name == "brand"}
                >
                  TODO
                </Popover>
              </Popover.Outer>

              {#unless @saved}
                <Divider orientation="vertical" color="beerus-100" height="10" />

                <Button class="px-2 text-trunks-100">
                  Clear all
                </Button>
              {/unless}
            </ButtonsList>
          </div>

          <Divider color="beerus-100" class="my-6" />

          <!-- TODO: Create a shared component -->
          <div class="flex p-6 overflow-x-scroll rounded bg-gohan-100 gap-x-4 no-scrollbar">
            <div :for={metric <- @metrics} class="flex-shrink-0 p-3 border-r pl-7 border-beerus-100 w-50">
              <p class="text-xs text-trunks-100">{metric.name}</p>
              <div class="flex gap-x-0.5 items-start">
                <div class="text-xl text-bulma-100">
                  {metric.value}
                </div>
                <div class={
                  "text-sm",
                  "text-roshi-100": metric.change > 0,
                  "text-chi_chi-100": metric.change <= 0
                }>
                  <span :if={metric.change > 0}>+</span>{metric.change}%
                </div>
              </div>
            </div>

            <div class="flex items-center justify-center flex-shrink-0 cursor-pointer gap-x-2 w-50">
              <div class="flex items-center justify-center w-6 h-6 rounded-sm bg-goku-80">
                <Icon name="icon_plus" />
              </div>
              <div class="text-sm whitespace-nowrap">Add metric</div>
            </div>
          </div>

          <div class="grid grid-cols-1 mt-6 lg:grid-cols-2 gap-x-4 gap-y-6">
            <BarChartWidget
              :for={widget <- Enum.sort_by(@widgets, & &1.index)}
              widget={widget}
              bar_bg_color={"bg-#{Enum.at(@colors, widget.index)}"}
              on_refresh="refresh_widget_data"
            />
          </div>
        </div>
      </div>
    </div>
    """
  end

  # TODO: Refactor
  def handle_event(
        "open_popover",
        %{"click_value" => click_value},
        socket
      ) do
    {:noreply, assign(socket, clicked_filter_name: click_value)}
  end

  # TODO: Refactor
  def handle_event(
        "close_popover",
        _,
        socket
      ) do
    {:noreply, assign(socket, clicked_filter_name: nil)}
  end

  def handle_event("tab_click", %{"selected-item" => selected_item}, socket) do
    socket =
      assign(socket,
        selected_tab: selected_item,
        metrics: get_metrics(),
        widgets: get_widgets()
      )

    {:noreply, socket}
  end

  def handle_event("refresh_widget_data", %{"index" => index}, socket) do
    widgets = socket.assigns.widgets
    widget = Enum.find(widgets, &(&1.index == String.to_integer(index)))

    widgets =
      List.update_at(widgets, widget.index, fn item ->
        %{item | data: generate_widget_data()}
      end)

    {:noreply, assign(socket, widgets: widgets)}
  end

  def handle_info({"update_filter_dates", %{start_date: start_date, end_date: end_date}}, socket) do
    socket =
      assign(socket,
        start_date: start_date,
        end_date: end_date,
        metrics: get_metrics(),
        widgets: get_widgets()
      )

    {:noreply, socket}
  end

  defp get_metrics() do
    @metrics
    |> Enum.map(fn name ->
      %{
        name: name,
        value: Enum.random(1_000_000..21_000_000) + Enum.random(1..99) / 100,
        change: Enum.random(-20..20)
      }
    end)
  end

  defp get_widgets() do
    @widget_names
    |> Enum.with_index()
    |> Enum.map(fn {name, index} ->
      %{
        index: index,
        title: name,
        data: generate_widget_data()
      }
    end)
  end

  def generate_widget_data() do
    Enum.map(
      ~w(Charlibobby Hima0919 Fox14445 Latuim Killbgx),
      fn line ->
        %{
          name: line,
          value: Enum.random(1_000..9_900) + Enum.random(1..99) / 100,
          change: Enum.random(-20..20)
        }
      end
    )
  end

  defp get_tabs() do
    [
      %{
        name: "Total",
        value: "total"
      },
      %{
        name: "Real",
        value: "real"
      },
      %{
        name: "Bonus",
        value: "bonus"
      }
    ]
  end
end