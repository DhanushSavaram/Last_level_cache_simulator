module trace_file_reader_debug;

  string file_name;
  int file;
  string default_file_name = "rwims.din"; 
  string line;
  initial begin

    if ($value$plusargs("file_name=%s", file_name)) 
     begin
      `ifdef DEBUG
        $display("Using specified file: %s", file_name);
      `endif
     end 

    else
     begin
      file_name = default_file_name;
      `ifdef DEBUG
        $display("No file name specified, using default file: %s", default_file_name);
      `endif
     end

    file = $fopen(file_name, "r");

    if (file == 0) 
     begin
      $fatal("Error: Could not open file '%s'", file_name);
     end

  while (!$feof(file)) 
    begin
      if ($fgets(line, file)) 
       begin
        `ifdef DEBUG
          $display("Parsed line: %s", line);
        `endif
       end
    end
    $fclose(file);
  end
endmodule
