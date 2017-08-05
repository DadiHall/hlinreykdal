
<div class="container">
    <div id='carousel-custom' class='carousel slide' data-ride='carousel'>
        <div class='carousel-outer'>
            <!-- me art lab slider -->
            <div class='carousel-inner '>
                <div class='item active'>
                    <%= image_tag @product.images.first.image.url(:medium), class: "img-responsive", id: "zoom_05" %>
                </div>
                <div class='item'>
                    <% @product.images[1..-1].each do |image_product| %>
                        <%= image_tag image_product.image.url(:medium), class: "img-responsive", id: "zoom_05" %>
                    <% end %>
                </div>

                <script>
                  $("#zoom_05").elevateZoom({ zoomType    : "inner", cursor: "crosshair" });
                </script>
            </div>
            <!-- sag sol -->
            <a class='left carousel-control' href='#carousel-custom' data-slide='prev'>
                <span class='glyphicon glyphicon-chevron-left'></span>
            </a>
            <a class='right carousel-control' href='#carousel-custom' data-slide='next'>
                <span class='glyphicon glyphicon-chevron-right'></span>
            </a>
        </div>
                    <!-- thumb -->
        <ol class='carousel-indicators mCustomScrollbar meartlab'>
            <li data-target='#carousel-custom' data-slide-to='0' class='active'>
                <%= image_tag @product.images.first.image.url(:medium), class: "img-responsive", id: "zoom_05" %>
            </li>
            <% @product.images[1..-1].each_with_index do |image_product, index| %>
                <li data-target='#carousel-custom' data-slide-to=<%= index + 1%> >
                    <%= image_tag image_product.image.url(:medium), class: "img-responsive", id: "" %>
                </li>
            <% end %>
            </li>
        </ol>
    </div>

    <script type="text/javascript">
        $(document).ready(function() {
            $(".mCustomScrollbar").mCustomScrollbar({axis:"x"});
        });
    </script>

</div>