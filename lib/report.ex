defmodule Report do
  defstruct id: "", amount_css: 0,
            amount_js: 0, amount_html_elements: 0,
            amount_meta: 0, amount_js_events: 0,
            amount_forms: 0, amount_forms_info: 0,
            amount_js_content: 0, amount_onclick_events: 0,
            form_info: [""], onclick_values: [""], has_ajax_call: false
end
