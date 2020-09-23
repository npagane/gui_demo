## trying to make a GUI to look at internucleosome attraction energies

close all
clear h

graphics_toolkit qt

h.ax = axes ("position", [0.05 0.42 0.9 0.5]);


function update_plot (obj, init = false)
  
  # define paramters
  radius = 5.2; height = 5.5;
  
  ## gcbo holds the handle of the control
  h = guidata (obj);
  recalc = false;
  reset = false;
  switch (gcbo)
    case {h.c1_rotateX}
      recalc = true;
    case {h.c1_rotateY}
      recalc = true;
    case {h.c1_rotateZ}
      recalc = true;
    case {h.c2_rotateX}
      recalc = true;
    case {h.c2_rotateY}
      recalc = true;
    case {h.c2_rotateZ}
      recalc = true;
    case {h.c1_translateX}
      recalc = true;
    case {h.c1_translateY}
      recalc = true;
    case {h.c1_translateZ}
      recalc = true;
    case {h.c2_translateX}
      recalc = true;
    case {h.c2_translateY}
      recalc = true;
    case {h.c2_translateZ}
      recalc = true;
    case {h.reset}
      reset = true;
      recalc = true;
  endswitch

  if (reset)
    set (h.c1_rotateX, "value", 0);
    set (h.c1_rotateY, "value", 0);
    set (h.c1_rotateZ, "value", 0);
    set (h.c2_rotateX, "value", 0);
    set (h.c2_rotateY, "value", 0);
    set (h.c2_rotateZ, "value", 0);
    set (h.c1_translateX, "value", 0);
    set (h.c1_translateY, "value", 0);
    set (h.c1_translateZ, "value", 0);
    set (h.c2_translateX, "value", 0);
    set (h.c2_translateY, "value", 0);
    set (h.c2_translateZ, "value", 0);
  endif
  
  if (recalc || init)
    # make first cylinder
    [x1, y1, z1] = cylinder([radius radius]);
    z1(2,:) = height;
    # make second cylinder
    x2 = x1; y2 = y1; z2 = z1;
    x2 += 3*radius;
    ############ rotations ############
    # rotations in X for cylinder 1
    c1_rotateX = get (h.c1_rotateX, "value");
    set (h.c1_rotateX_label, "string", sprintf ("rotate X: %.1f°", c1_rotateX));
    for i = 1:2
      temp = rotateX(c1_rotateX)*[x1(i,:); y1(i,:); z1(i,:)];
      x1(i,:) = temp(1,:); y1(i,:) = temp(2,:); z1(i,:) = temp(3,:);
    end
    # rotations in Y for cylinder 1
    c1_rotateY = get (h.c1_rotateY, "value");
    set (h.c1_rotateY_label, "string", sprintf ("rotate Y: %.1f°", c1_rotateY));
    for i = 1:2
      temp = rotateY(c1_rotateY)*[x1(i,:); y1(i,:); z1(i,:)];
      x1(i,:) = temp(1,:); y1(i,:) = temp(2,:); z1(i,:) = temp(3,:);
    end
    # rotations in Z for cylinder 1
    c1_rotateZ = get (h.c1_rotateZ, "value");
    set (h.c1_rotateZ_label, "string", sprintf ("rotate Z: %.1f°", c1_rotateZ));
    for i = 1:2
      temp = rotateZ(c1_rotateZ)*[x1(i,:); y1(i,:); z1(i,:)];
      x1(i,:) = temp(1,:); y1(i,:) = temp(2,:); z1(i,:) = temp(3,:);
    end
    # rotations in X for cylinder 2
    c2_rotateX = get (h.c2_rotateX, "value");
    set (h.c2_rotateX_label, "string", sprintf ("rotate X: %.1f°", c2_rotateX));
    for i = 1:2
      temp = rotateX(c2_rotateX)*[x2(i,:); y2(i,:); z2(i,:)];
      x2(i,:) = temp(1,:); y2(i,:) = temp(2,:); z2(i,:) = temp(3,:);
    end
    # rotations in Y for cylinder 2
    c2_rotateY = get (h.c2_rotateY, "value");
    set (h.c2_rotateY_label, "string", sprintf ("rotate Y: %.1f°", c2_rotateY));
    for i = 1:2
      temp = rotateY(c2_rotateY)*[x2(i,:); y2(i,:); z2(i,:)];
      x2(i,:) = temp(1,:); y2(i,:) = temp(2,:); z2(i,:) = temp(3,:);
    end
    # rotations in Z for cylinder 2
    c2_rotateZ = get (h.c2_rotateZ, "value");
    set (h.c2_rotateZ_label, "string", sprintf ("rotate Z: %.1f°", c2_rotateZ));
    for i = 1:2
      temp = rotateZ(c2_rotateZ)*[x2(i,:); y2(i,:); z2(i,:)];
      x2(i,:) = temp(1,:); y2(i,:) = temp(2,:); z2(i,:) = temp(3,:);
    end
    ############ tranlsations ############
    # translations in X for cylinder 1
    c1_translateX = get (h.c1_translateX, "value");
    set (h.c1_translateX_label, "string", sprintf ("translate X: %.1f nm", c1_translateX));
    for i = 1:2
      x1(i,:) = x1(i,:) + c1_translateX;
    end
    # translations in Y for cylinder 1
    c1_translateY = get (h.c1_translateY, "value");
    set (h.c1_translateY_label, "string", sprintf ("translate Y: %.1f nm", c1_translateY));
    for i = 1:2
      y1(i,:) = y1(i,:) + c1_translateY;
    end
    # translations in Z for cylinder 1
    c1_translateZ = get (h.c1_translateZ, "value");
    set (h.c1_translateZ_label, "string", sprintf ("translate Z: %.1f nm", c1_translateZ));
    for i = 1:2
      z1(i,:) = z1(i,:) + c1_translateZ;
    end
    # translations in X for cylinder 2
    c2_translateX = get (h.c2_translateX, "value");
    set (h.c2_translateX_label, "string", sprintf ("translate X: %.1f nm", c2_translateX));
    for i = 1:2
      x2(i,:) = x2(i,:) + c2_translateX;
    end
    # translations in Y for cylinder 2
    c2_translateY = get (h.c2_translateY, "value");
    set (h.c2_translateY_label, "string", sprintf ("translate Y: %.1f nm", c2_translateY));
    for i = 1:2
      y2(i,:) = y2(i,:) + c2_translateY;
    end
    # translations in Z for cylinder 2
    c2_translateZ = get (h.c2_translateZ, "value");
    set (h.c2_translateZ_label, "string", sprintf ("translate Z: %.1f nm", c2_translateZ));
    for i = 1:2
      z2(i,:) = z2(i,:) + c2_translateZ;
    end
    ############ plot cylinders ############
    if (recalc)
      cla;
    endif
    figure 1; hold on;
    s1 = surf(x1, y1, z1, 'FaceColor', 'red');
    s2 = surf(x2, y2, z2, 'FaceColor', 'blue');
    [ff, fs, ss] = determineOrientation(x1, y1, z1, x2, y2, z2);
    title(sprintf ("face-face: %.2f, face-side: %.2f, side-side: %.2f", ff, fs, ss), ...
          'FontSize', 18)
    axis off;
    hold off;
    extremeMin = min(min([x1 x2 y1 y2 z1 z2]));
    extremeMax = max(max([x1 x2 y1 y2 z1 z2]));
    xlim([extremeMin extremeMax]);
    ylim([extremeMin extremeMax]);
    zlim([extremeMin extremeMax]);
    h.plot = gcf;
  endif

endfunction

function mat = rotateX(theta)
  theta = theta*pi/180;
  mat = [1 0 0; 0 cos(theta) -sin(theta); 0 sin(theta) cos(theta)];
end

function mat = rotateY(theta)
  theta = theta*pi/180;
  mat = [cos(theta) 0 sin(theta); 0 1 0; -sin(theta) 0 cos(theta)];
end

function mat = rotateZ(theta)
  theta = theta*pi/180;
  mat = [cos(theta) -sin(theta) 0; sin(theta) cos(theta) 0; 0 0 1];
end

function [ff, fs, ss] = determineOrientation(x1, y1, z1, x2, y2, z2)
  # find center of polygons 
  poly1 = [mean(mean(x1,2)) mean(mean(y1,2)) mean(mean(z1,2))];
  poly2 = [mean(mean(x2,2)) mean(mean(y2,2)) mean(mean(z2,2))];
  # construct face 1 normal vector (pointing up through face)
  face1top = [mean(x1(1,:)) mean(y1(1,:)) mean(z1(1,:))];
  face1bot = [mean(x1(2,:)) mean(y1(2,:)) mean(z1(2,:))];
  face1 = face1top - face1bot;
  # construct face 2 normal vector (pointing up through face)
  face2top = [mean(x2(1,:)) mean(y2(1,:)) mean(z2(1,:))];
  face2bot = [mean(x2(2,:)) mean(y2(2,:)) mean(z2(2,:))];
  face2 = face2top - face2bot;
  # cospsi angle
  cospsi = dot(face1/norm(face1), face2/norm(face2));
  # list of combinatorial face attractions
  faceDistList = zeros(4,3);
  faceDistList(1,:) = face1top - face2bot;
  faceDistList(2,:) = face1top - face2top;
  faceDistList(3,:) = face1bot - face2bot;
  faceDistList(4,:) = face1bot - face2top;
  [tempMin, indMin] = min(sqrt(sum(faceDistList.^2,2)));
  distS = faceDistList(indMin, :);
  # costheta angle
  costheta1 = dot(distS/norm(distS), face1/norm(face1));
  costheta2 = dot(distS/norm(distS), face2/norm(face2));
  # get face-face contribution
  ff = abs(costheta1)*abs(costheta2);
  # determine other charactestic angls other than theta
  distC = poly1 - poly2;
  cosphi1 = dot(distC/norm(distC), face1/norm(face1));
  cosphi2 = dot(distC/norm(distC), face2/norm(face2));
  # get face-side contribution
  temp = abs(cosphi1) + abs(cosphi2);
  if (temp > 1)
    temp = 2 - temp;
  endif
  fs = (1-abs(cospsi))*temp;
  # get side-side contribution
  ss = (1-abs(cosphi1))*(1-abs(cosphi2));
end

############ rotations ############

## rotation sliders for cylinder 1
h.c1_rotateX_label = uicontrol ("style", "text",
                           "units", "normalized",
                           "string", "rotate X:",
                           "horizontalalignment", "left",
                           "position", [0.05 0.3 0.15 0.08],
                           "foregroundcolor", "red");
                           
                           
h.c1_rotateX = uicontrol ("style", "slider",
                            "units", "normalized",
                            "min", -90,
                            "max", 90,
                            "callback", @update_plot,
                            "value", 0,
                            "position", [0.05 0.26 0.15 0.06]);
                            
h.c1_rotateY_label = uicontrol ("style", "text",
                           "units", "normalized",
                           "string", "rotate Y:",
                           "horizontalalignment", "left",
                           "position", [0.05 0.18 0.15 0.08],
                           "foregroundcolor", "red");
                           
                           
h.c1_rotateY = uicontrol ("style", "slider",
                            "units", "normalized",
                            "min", -90,
                            "max", 90,
                            "callback", @update_plot,
                            "value", 0,
                            "position", [0.05 0.14 0.15 0.06]);  
              
h.c1_rotateZ_label = uicontrol ("style", "text",
                           "units", "normalized",
                           "string", "rotate Z:",
                           "horizontalalignment", "left",
                           "position", [0.05 0.04 0.15 0.08],
                           "foregroundcolor", "red");
                           
                           
h.c1_rotateZ = uicontrol ("style", "slider",
                            "units", "normalized",
                            "min", -90,
                            "max", 90,
                            "callback", @update_plot,
                            "value", 0,
                            "position", [0.05 0.0 0.15 0.06]);    
                
    
## rotation sliders for cylinder 2
h.c2_rotateX_label = uicontrol ("style", "text",
                           "units", "normalized",
                           "string", "rotate X:",
                           "horizontalalignment", "left",
                           "position", [0.55 0.3 0.15 0.08],
                           "foregroundcolor", "blue");
                           
                           
h.c2_rotateX = uicontrol ("style", "slider",
                            "units", "normalized",
                            "min", -90,
                            "max", 90,
                            "callback", @update_plot,
                            "value", 0,
                            "position", [0.55 0.26 0.15 0.06]);
                            
h.c2_rotateY_label = uicontrol ("style", "text",
                           "units", "normalized",
                           "string", "rotate Y:",
                           "horizontalalignment", "left",
                           "position", [0.55 0.18 0.15 0.08],
                           "foregroundcolor", "blue");
                           
                           
h.c2_rotateY = uicontrol ("style", "slider",
                            "units", "normalized",
                            "min", -90,
                            "max", 90,
                            "callback", @update_plot,
                            "value", 0,
                            "position", [0.55 0.14 0.15 0.06]);  
              
h.c2_rotateZ_label = uicontrol ("style", "text",
                           "units", "normalized",
                           "string", "rotate Z:",
                           "horizontalalignment", "left",
                           "position", [0.55 0.04 0.15 0.08],
                           "foregroundcolor", "blue");
                           
                           
h.c2_rotateZ = uicontrol ("style", "slider",
                            "units", "normalized",
                            "min", -90,
                            "max", 90,
                            "callback", @update_plot,
                            "value", 0,
                            "position", [0.55 0.0 0.15 0.06]);  
             
############ translations ############

## translation sliders for cylinder 1
h.c1_translateX_label = uicontrol ("style", "text",
                           "units", "normalized",
                           "string", "translate X:",
                           "horizontalalignment", "left",
                           "position", [0.30 0.3 0.15 0.08],
                           "foregroundcolor", "red");
                           
                           
h.c1_translateX = uicontrol ("style", "slider",
                            "units", "normalized",
                            "min", -20,
                            "max", 20,
                            "callback", @update_plot,
                            "value", 0,
                            "position", [0.30 0.26 0.15 0.06]);
                            
h.c1_translateY_label = uicontrol ("style", "text",
                           "units", "normalized",
                           "string", "translate Y:",
                           "horizontalalignment", "left",
                           "position", [0.30 0.18 0.15 0.08],
                           "foregroundcolor", "red");
                           
                           
h.c1_translateY = uicontrol ("style", "slider",
                            "units", "normalized",
                            "min", -20,
                            "max", 20,
                            "callback", @update_plot,
                            "value", 0,
                            "position", [0.30 0.14 0.15 0.06]);  
              
h.c1_translateZ_label = uicontrol ("style", "text",
                           "units", "normalized",
                           "string", "translate Z:",
                           "horizontalalignment", "left",
                           "position", [0.30 0.04 0.15 0.08],
                           "foregroundcolor", "red");
                           
                           
h.c1_translateZ = uicontrol ("style", "slider",
                            "units", "normalized",
                            "min", -20,
                            "max", 20,
                            "callback", @update_plot,
                            "value", 0,
                            "position", [0.30 0.0 0.15 0.06]);    
                
    
## translation sliders for cylinder 2
h.c2_translateX_label = uicontrol ("style", "text",
                           "units", "normalized",
                           "string", "translate X:",
                           "horizontalalignment", "left",
                           "position", [0.80 0.3 0.15 0.08],
                           "foregroundcolor", "blue");
                           
                           
h.c2_translateX = uicontrol ("style", "slider",
                            "units", "normalized",
                            "min", -20,
                            "max", 20,
                            "callback", @update_plot,
                            "value", 0,
                            "position", [0.80 0.26 0.15 0.06]);
                            
h.c2_translateY_label = uicontrol ("style", "text",
                           "units", "normalized",
                           "string", "translate Y:",
                           "horizontalalignment", "left",
                           "position", [0.80 0.18 0.15 0.08],
                           "foregroundcolor", "blue");
                           
                           
h.c2_translateY = uicontrol ("style", "slider",
                            "units", "normalized",
                            "min", -20,
                            "max", 20,
                            "callback", @update_plot,
                            "value", 0,
                            "position", [0.80 0.14 0.15 0.06]);  
              
h.c2_translateZ_label = uicontrol ("style", "text",
                           "units", "normalized",
                           "string", "translate Z:",
                           "horizontalalignment", "left",
                           "position", [0.80 0.04 0.15 0.08],
                           "foregroundcolor", "blue");
                           
                           
h.c2_translateZ = uicontrol ("style", "slider",
                            "units", "normalized",
                            "min", -20,
                            "max", 20,
                            "callback", @update_plot,
                            "value", 0,
                            "position", [0.80 0.0 0.15 0.06]);  
                            
## reset button
h.reset = uicontrol ("style", "pushbutton",
                          "units", "normalized",
                          "callback", @update_plot,
                          "string", "reset",
                          "position", [0.95 0.00 0.05 0.04]);              


set (gcf, "color", get(0, "defaultuicontrolbackgroundcolor"))
guidata (gcf, h)
update_plot (gcf, true);