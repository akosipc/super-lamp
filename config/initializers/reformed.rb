Reformed::FormBuilder.input_wrapper = lambda do |controls, options|
  "<div class=\"form-group\">
    #{controls[:label]}
    #{controls[:input]}
   </div>
  "
end

