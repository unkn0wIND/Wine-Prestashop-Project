{if isset($listing.rendered_facets)}
<div id="search_filters_wrapper" class="hidden-md-down block"> <!-- hidden-sm-down -->
  <div id="search_filter_controls" class="hidden-lg-up"> <!--  -->
      <span id="_mobile_search_filters_clear_all"></span> 
      <button class="btn btn-secondary ok">
        <i class="material-icons">&#xE876;</i>
        {l s='OK' d='Shop.Theme.Actions'}
      </button>
  </div>
  {$listing.rendered_facets nofilter}
</div>
{/if}
