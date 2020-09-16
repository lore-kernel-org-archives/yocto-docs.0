Received: from mail-pj1-f65.google.com (mail-pj1-f65.google.com [209.85.216.65])
 by mx.groups.io with SMTP id smtpd.web11.521.1600287225821325093
 for <docs@lists.yoctoproject.org>;
 Wed, 16 Sep 2020 13:13:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=WW9erkPz;
 spf=pass (domain: gmail.com, ip: 209.85.216.65, mailfrom: ticotimo@gmail.com)
Received: by mail-pj1-f65.google.com with SMTP id u3so29045pjr.3
        for <docs@lists.yoctoproject.org>; Wed, 16 Sep 2020 13:13:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=SoI5Waj3fgLalrq11/pL3KwUcSM9VAPuhZozHe5k8/Q=;
        b=WW9erkPz9qKB8bLJ9LbM87j6kCwXhOvEmcOpS2ZqT0c1Xe0nTFbnmBsxC9tCz+a2yT
         xViFJZsd6kEkrnBm3s8vIEt24Owr2qlUtlyRR+pFLeyx+5TtSGEUzJXaOVI1l6solgXI
         RmBcs930mP0yn9f5APp3uIKp54VhafdcKZ5E+B4JQxD5miH0167JWxWxeAu1c6LsGq+M
         1cSYdR+vlrQjH9h/EsMGrIyy2vwcxT1wx3AOllAw5h1/2n2x8BzJRBF1DbRkuGI8tdXG
         HwabpsYvwH+fRT15IOZdx9iVQ2dK6vzPGvQeJ7VJLyJjLDF0hCUGR9UvVwUh1Uk97Lz4
         mydw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=SoI5Waj3fgLalrq11/pL3KwUcSM9VAPuhZozHe5k8/Q=;
        b=PIawmG6fzziED1XDC9YjUE/lk1Y1nl9YFlVZzHC+jI0YOB8LQ6ZS9Wpk4c91mkuDyy
         eyllh1ZkMa9RLyTDkVLATfPiMyjVydOWMR4MxRyxQAUNE+wyThHZW6ao4Ih5EQXilFy8
         FsrPUuuqy1yU/WtAhsOtrf6XYbCtrRgRCq5HCtSu0FyiNarlwRK0okk5/ZrkodImrILp
         0hA+gujNey99pNIYreMcBrrgsB6ABdn/sOBM208jiO3zwK758eY8P2AJ3p3M/W0MDvib
         ghSKT/QAnT+XPBeb2foHHdtKdMRC3P8XqeKc0hjH9SEpJMDerQX0LFgWJTxWdJd4YdIV
         whkA==
X-Gm-Message-State: AOAM5311nGF5jLiAOpue9oIsqG24uSGAQURHQcKw1A41L1dgW9RrninH
	u46pIOIlr9QjB4v7YQFxFNRODIJ5hPuoXA==
X-Google-Smtp-Source: ABdhPJzr5d/EByiO5Dl22HOc4/Lty+42uUgPHebMAbdMyLJkKc1XzfxpLpz79zB8Tsg4k0gLJuum2g==
X-Received: by 2002:a17:902:c254:b029:d1:f2b3:a46b with SMTP id 20-20020a170902c254b02900d1f2b3a46bmr3071893plg.74.1600287223214;
        Wed, 16 Sep 2020 13:13:43 -0700 (PDT)
Return-Path: <ticotimo@gmail.com>
Received: from thetis.hsd1.or.comcast.net ([2601:1c0:6000:9640:8d10:c5:33a5:735c])
        by smtp.gmail.com with ESMTPSA id i20sm15639858pgk.77.2020.09.16.13.13.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2020 13:13:42 -0700 (PDT)
From: "Tim Orling" <ticotimo@gmail.com>
To: docs@lists.yoctoproject.org
Cc: Tim Orling <timothy.t.orling@linux.intel.com>
Subject: [PATCH v2] sphinx: toaster-manual: fix vars, links, code blocks
Date: Wed, 16 Sep 2020 13:13:37 -0700
Message-Id: <20200916201337.25261-1-ticotimo@gmail.com>
X-Mailer: git-send-email 2.25.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Tim Orling <timothy.t.orling@linux.intel.com>

Also update Django links to 2.2 LTS release (from 1.11)
Replace most references to 'rocko' with variable

Signed-off-by: Tim Orling <timothy.t.orling@linux.intel.com>
---

Changes in V2:
* Drop new custom links in favor of automatic links
* Caught some additional shell examples
* Set pygments to shell in files that are predominantly shell code-blocks
* Use JSON and html pygments as recommended (bonus ini and apache)
* Replace # shell example with $ sudo
* Caught some errant unicode chars
* Trailing whitespace errors

 .../toaster-manual/toaster-manual-intro.rst   |   8 +-
 .../toaster-manual-reference.rst              | 423 +++++++++++------
 .../toaster-manual-setup-and-use.rst          | 448 ++++++++++++------
 .../toaster-manual/toaster-manual-start.rst   |  36 +-
 4 files changed, 628 insertions(+), 287 deletions(-)

diff --git a/documentation/toaster-manual/toaster-manual-intro.rst b/documentation/toaster-manual/toaster-manual-intro.rst
index cc972f7c7..0b7cd41c8 100644
--- a/documentation/toaster-manual/toaster-manual-intro.rst
+++ b/documentation/toaster-manual/toaster-manual-intro.rst
@@ -26,9 +26,9 @@ extensive information about the build process.
    Yocto Project releases 1.8 and beyond. With the Toaster web
    interface, you can:
 
-   -  Browse layers listed in the various `layer
-      sources <#layer-source>`__ that are available in your project
-      (e.g. the OpenEmbedded Layer Index at
+   -  Browse layers listed in the various
+      :ref:`layer sources <toaster-manual/toaster-manual-reference:layer source>`
+      that are available in your project (e.g. the OpenEmbedded Layer Index at
       http://layers.openembedded.org/layerindex/).
 
    -  Browse images, recipes, and machines provided by those layers.
@@ -78,7 +78,7 @@ extensive information about the build process.
    -  See performance information such as build time, task time, CPU
       usage, and disk I/O.
 
-For an overview of Toaster shipped with the Yocto Project DISTRO
+For an overview of Toaster shipped with the Yocto Project &DISTRO;
 Release, see the "`Toaster - Yocto Project
 2.2 <https://youtu.be/BlXdOYLgPxA>`__" video.
 
diff --git a/documentation/toaster-manual/toaster-manual-reference.rst b/documentation/toaster-manual/toaster-manual-reference.rst
index a628c78cc..e95536e05 100644
--- a/documentation/toaster-manual/toaster-manual-reference.rst
+++ b/documentation/toaster-manual/toaster-manual-reference.rst
@@ -67,11 +67,10 @@ familiar with where they reside. You will need that information when you
 set up the code for the web application that "hooks" into your set of
 layers.
 
-For general information on layers, see the "`The Yocto Project Layer
-Model <&YOCTO_DOCS_OM_URL;#the-yocto-project-layer-model>`__" section in
-the Yocto Project Overview and Concepts Manual. For information on how
-to create layers, see the "`Understanding and Creating
-Layers <&YOCTO_DOCS_DEV_URL;#understanding-and-creating-layers>`__"
+For general information on layers, see the
+":ref:`overview-manual/overview-manual-yp-intro:the yocto project layer model`"
+section in the Yocto Project Overview and Concepts Manual. For information on how
+to create layers, see the ":ref:`dev-manual/dev-manual-common-tasks:understanding and creating layers`"
 section in the Yocto Project Development Tasks Manual.
 
 .. _configuring-toaster-to-hook-into-your-layer-source:
@@ -98,7 +97,9 @@ Use the Administration Interface
 Access the administration interface through a browser by entering the
 URL of your Toaster instance and adding "``/admin``" to the end of the
 URL. As an example, if you are running Toaster locally, use the
-following URL: http://127.0.0.1:8000/admin
+following URL::
+
+   http://127.0.0.1:8000/admin
 
 The administration interface has a "Layer sources" section that includes
 an "Add layer source" button. Click that button and provide the required
@@ -110,12 +111,19 @@ Use the Fixture Feature
 The Django fixture feature overrides the default layer server when you
 use it to specify a custom URL. To use the fixture feature, create (or
 edit) the file ``bitbake/lib/toaster.orm/fixtures/custom.xml``, and then
-set the following Toaster setting to your custom URL: <?xml
-version="1.0" ?> <django-objects version="1.0"> <object
-model="orm.toastersetting" pk="100"> <field name="name"
-type="CharField">CUSTOM_LAYERINDEX_SERVER</field> <field name="value"
-type="CharField">https://layers.my_organization.org/layerindex/branch/master/layers/</field>
-</object> <django-objects> When you start Toaster for the first time, or
+set the following Toaster setting to your custom URL:
+
+.. code-block:: xml
+
+   <?xml version="1.0" ?>
+   <django-objects version="1.0">
+      <object model="orm.toastersetting" pk="100">
+         <field name="name" type="CharField">CUSTOM_LAYERINDEX_SERVER</field>
+         <field name="value" type="CharField">https://layers.my_organization.org/layerindex/branch/master/layers/</field>
+      </object>
+   <django-objects>
+
+When you start Toaster for the first time, or
 if you delete the file ``toaster.sqlite`` and restart, the database will
 populate cleanly from this layer index server.
 
@@ -125,10 +133,15 @@ is available by using the Toaster web interface. To do that, visit the
 your layer source should be listed there.
 
 If you change the information in your layer index server, refresh the
-Toaster database by running the following command: $
-bitbake/lib/toaster/manage.py lsupdates If Toaster can reach the API
-URL, you should see a message telling you that Toaster is updating the
-layer source information.
+Toaster database by running the following command:
+
+.. code-block:: shell
+
+   $ bitbake/lib/toaster/manage.py lsupdates
+
+
+If Toaster can reach the API URL, you should see a message telling you that
+Toaster is updating the layer source information.
 
 .. _toaster-releases:
 
@@ -157,11 +170,11 @@ to build against different revisions of OpenEmbedded and BitBake.
 
 As shipped, Toaster is configured to work with the following releases:
 
--  *Yocto Project DISTRO "DISTRO_NAME" or OpenEmbedded "DISTRO_NAME":*
+-  *Yocto Project &DISTRO; "&DISTRO_NAME;" or OpenEmbedded "&DISTRO_NAME;":*
    This release causes your Toaster projects to build against the head
-   of the DISTRO_NAME_NO_CAP branch at
-   https://git.yoctoproject.org/cgit/cgit.cgi/poky/log/?h=rocko or
-   http://git.openembedded.org/openembedded-core/commit/?h=rocko.
+   of the &DISTRO_NAME_NO_CAP; branch at
+   https://git.yoctoproject.org/cgit/cgit.cgi/poky/log/?h=&DISTRO_NAME_NO_CAP; or
+   http://git.openembedded.org/openembedded-core/commit/?h=&DISTRO_NAME_NO_CAP;.
 
 -  *Yocto Project "Master" or OpenEmbedded "Master":* This release
    causes your Toaster Projects to build against the head of the master
@@ -224,9 +237,14 @@ particularly useful if your custom configuration defines fewer releases
 or layers than the default fixture files.
 
 The following example sets "name" to "CUSTOM_XML_ONLY" and its value to
-"True". <object model="orm.toastersetting" pk="99"> <field
-type="CharField" name="name">CUSTOM_XML_ONLY</field> <field
-type="CharField" name="value">True</field> </object>
+"True".
+
+.. code-block:: xml
+
+   <object model="orm.toastersetting" pk="99">
+      <field type="CharField" name="name">CUSTOM_XML_ONLY</field>
+      <field type="CharField" name="value">True</field>
+   </object>
 
 Understanding Fixture File Format
 ---------------------------------
@@ -244,10 +262,17 @@ Defining the Default Distro and Other Values
 This section defines the default distro value for new projects. By
 default, it reserves the first Toaster Setting record "1". The following
 demonstrates how to set the project default value for
-:term:`DISTRO`: <!-- Set the project
-default value for DISTRO --> <object model="orm.toastersetting" pk="1">
-<field type="CharField" name="name">DEFCONF_DISTRO</field> <field
-type="CharField" name="value">poky</field> </object> You can override
+:term:`DISTRO`:
+
+.. code-block:: xml
+
+   <!-- Set the project default value for DISTRO -->
+   <object model="orm.toastersetting" pk="1">
+      <field type="CharField" name="name">DEFCONF_DISTRO</field>
+      <field type="CharField" name="value">poky</field>
+   </object>
+
+You can override
 other default project values by adding additional Toaster Setting
 sections such as any of the settings coming from the ``settings.xml``
 file. Also, you can add custom values that are included in the BitBake
@@ -258,40 +283,53 @@ Defining BitBake Version
 ~~~~~~~~~~~~~~~~~~~~~~~~
 
 The following defines which version of BitBake is used for the following
-release selection: <!-- Bitbake versions which correspond to the
-metadata release --> <object model="orm.bitbakeversion" pk="1"> <field
-type="CharField" name="name">rocko</field> <field type="CharField"
-name="giturl">git://git.yoctoproject.org/poky</field> <field
-type="CharField" name="branch">rocko</field> <field type="CharField"
-name="dirpath">bitbake</field> </object>
+release selection:
+
+.. code-block:: xml
+
+   <!-- Bitbake versions which correspond to the metadata release -->
+   <object model="orm.bitbakeversion" pk="1">
+      <field type="CharField" name="name">&DISTRO_NAME_NO_CAP;</field>
+      <field type="CharField" name="giturl">git://git.yoctoproject.org/poky</field>
+      <field type="CharField" name="branch">&DISTRO_NAME_NO_CAP;</field>
+      <field type="CharField" name="dirpath">bitbake</field>
+   </object>
 
 .. _defining-releases:
 
 Defining Release
 ~~~~~~~~~~~~~~~~
 
-The following defines the releases when you create a new project. <!--
-Releases available --> <object model="orm.release" pk="1"> <field
-type="CharField" name="name">rocko</field> <field type="CharField"
-name="description">Yocto Project 2.4 "Rocko"</field> <field
-rel="ManyToOneRel" to="orm.bitbakeversion"
-name="bitbake_version">1</field> <field type="CharField"
-name="branch_name">rocko</field> <field type="TextField"
-name="helptext">Toaster will run your builds using the tip of the <a
-href="http://git.yoctoproject.org/cgit/cgit.cgi/poky/log/?h=rocko">Yocto
-Project Rocko branch</a>.</field> </object> The "pk" value must match
-the above respective BitBake version record.
+The following defines the releases when you create a new project:
+
+.. code-block:: xml
+
+   <!-- Releases available -->
+   <object model="orm.release" pk="1">
+      <field type="CharField" name="name">&DISTRO_NAME_NO_CAP;</field>
+      <field type="CharField" name="description">Yocto Project &DISTRO; "&DISTRO_NAME;"</field>
+      <field rel="ManyToOneRel" to="orm.bitbakeversion" name="bitbake_version">1</field>
+      <field type="CharField" name="branch_name">&DISTRO_NAME_NO_CAP;</field>
+      <field type="TextField" name="helptext">Toaster will run your builds using the tip of the <a href="http://git.yoctoproject.org/cgit/cgit.cgi/poky/log/?h=&DISTRO_NAME_NO_CAP;">Yocto Project &DISTRO_NAME; branch</a>.</field>
+   </object>
+
+The "pk" value must match the above respective BitBake version record.
 
 Defining the Release Default Layer Names
 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 
-The following defines the default layers for each release: <!-- Default
-project layers for each release --> <object
-model="orm.releasedefaultlayer" pk="1"> <field rel="ManyToOneRel"
-to="orm.release" name="release">1</field> <field type="CharField"
-name="layer_name">openembedded-core</field> </object> The 'pk' values in
-the example above should start at "1" and increment uniquely. You can
-use the same layer name in multiple releases.
+The following defines the default layers for each release:
+
+.. code-block:: xml
+
+   <!-- Default project layers for each release -->
+   <object model="orm.releasedefaultlayer" pk="1">
+      <field rel="ManyToOneRel" to="orm.release" name="release">1</field>
+      <field type="CharField" name="layer_name">openembedded-core</field>
+   </object>
+
+The 'pk' values in the example above should start at "1" and increment
+uniquely. You can use the same layer name in multiple releases.
 
 Defining Layer Definitions
 ~~~~~~~~~~~~~~~~~~~~~~~~~~
@@ -302,35 +340,42 @@ for each respective release. You must have one ``orm.layer`` entry for
 each layer. Then, with each entry you need a set of
 ``orm.layer_version`` entries that connects the layer with each release
 that includes the layer. In general all releases include the layer.
-<object model="orm.layer" pk="1"> <field type="CharField"
-name="name">openembedded-core</field> <field type="CharField"
-name="layer_index_url"></field> <field type="CharField"
-name="vcs_url">git://git.yoctoproject.org/poky</field> <field
-type="CharField"
-name="vcs_web_url">http://git.yoctoproject.org/cgit/cgit.cgi/poky</field>
-<field type="CharField"
-name="vcs_web_tree_base_url">http://git.yoctoproject.org/cgit/cgit.cgi/poky/tree/%path%?h=%branch%</field>
-<field type="CharField"
-name="vcs_web_file_base_url">http://git.yoctoproject.org/cgit/cgit.cgi/poky/tree/%path%?h=%branch%</field>
-</object> <object model="orm.layer_version" pk="1"> <field
-rel="ManyToOneRel" to="orm.layer" name="layer">1</field> <field
-type="IntegerField" name="layer_source">0</field> <field
-rel="ManyToOneRel" to="orm.release" name="release">1</field> <field
-type="CharField" name="branch">rocko</field> <field type="CharField"
-name="dirpath">meta</field> </object> <object model="orm.layer_version"
-pk="2"> <field rel="ManyToOneRel" to="orm.layer" name="layer">1</field>
-<field type="IntegerField" name="layer_source">0</field> <field
-rel="ManyToOneRel" to="orm.release" name="release">2</field> <field
-type="CharField" name="branch">HEAD</field> <field type="CharField"
-name="commit">HEAD</field> <field type="CharField"
-name="dirpath">meta</field> </object> <object model="orm.layer_version"
-pk="3"> <field rel="ManyToOneRel" to="orm.layer" name="layer">1</field>
-<field type="IntegerField" name="layer_source">0</field> <field
-rel="ManyToOneRel" to="orm.release" name="release">3</field> <field
-type="CharField" name="branch">master</field> <field type="CharField"
-name="dirpath">meta</field> </object> The layer "pk" values above must
-be unique, and typically start at "1". The layer version "pk" values
-must also be unique across all layers, and typically start at "1".
+
+.. code-block:: xml
+
+   <object model="orm.layer" pk="1">
+      <field type="CharField" name="name">openembedded-core</field>
+      <field type="CharField" name="layer_index_url"></field>
+      <field type="CharField" name="vcs_url">git://git.yoctoproject.org/poky</field>
+      <field type="CharField" name="vcs_web_url">http://git.yoctoproject.org/cgit/cgit.cgi/poky</field>
+      <field type="CharField" name="vcs_web_tree_base_url">http://git.yoctoproject.org/cgit/cgit.cgi/poky/tree/%path%?h=%branch%</field>
+      <field type="CharField" name="vcs_web_file_base_url">http://git.yoctoproject.org/cgit/cgit.cgi/poky/tree/%path%?h=%branch%</field>
+   </object>
+   <object model="orm.layer_version" pk="1">
+      <field rel="ManyToOneRel" to="orm.layer" name="layer">1</field>
+      <field type="IntegerField" name="layer_source">0</field>
+      <field rel="ManyToOneRel" to="orm.release" name="release">1</field>
+      <field type="CharField" name="branch">&DISTRO_NAME_NO_CAP;</field>
+      <field type="CharField" name="dirpath">meta</field>
+   </object> <object model="orm.layer_version" pk="2">
+      <field rel="ManyToOneRel" to="orm.layer" name="layer">1</field>
+      <field type="IntegerField" name="layer_source">0</field>
+      <field rel="ManyToOneRel" to="orm.release" name="release">2</field>
+      <field type="CharField" name="branch">HEAD</field>
+      <field type="CharField" name="commit">HEAD</field>
+      <field type="CharField" name="dirpath">meta</field>
+   </object>
+   <object model="orm.layer_version" pk="3">
+      <field rel="ManyToOneRel" to="orm.layer" name="layer">1</field>
+      <field type="IntegerField" name="layer_source">0</field>
+      <field rel="ManyToOneRel" to="orm.release" name="release">3</field>
+      <field type="CharField" name="branch">master</field>
+      <field type="CharField" name="dirpath">meta</field>
+   </object>
+
+The layer "pk" values above must be unique, and typically start at "1". The
+layer version "pk" values must also be unique across all layers, and typically
+start at "1".
 
 Remote Toaster Monitoring
 =========================
@@ -350,26 +395,53 @@ Checking Health
 
 Before you use remote Toaster monitoring, you should do a health check.
 To do this, ping the Toaster server using the following call to see if
-it is still alive: http://host:port/health Be sure to provide values for
-host and port. If the server is alive, you will get the response HTML:
-<!DOCTYPE html> <html lang="en"> <head><title>Toaster
-Health</title></head> <body>Ok</body> </html>
+it is still alive::
+
+   http://host:port/health
+
+Be sure to provide values for host and port. If the server is alive, you will
+get the response HTML:
+
+.. code-block:: html
+
+   <!DOCTYPE html>
+   <html lang="en">
+      <head><title>Toaster Health</title></head>
+      <body>Ok</body>
+   </html>
 
 Determining Status of Builds in Progress
 ----------------------------------------
 
 Sometimes it is useful to determine the status of a build in progress.
-To get the status of pending builds, use the following call:
-http://host:port/toastergui/api/building Be sure to provide values for
-host and port. The output is a JSON file that itemizes all builds in
-progress. This file includes the time in seconds since each respective
-build started as well as the progress of the cloning, parsing, and task
-execution. The following is sample output for a build in progress:
-{"count": 1, "building": [ {"machine": "beaglebone", "seconds":
-"463.869", "task": "927:2384", "distro": "poky", "clone": "1:1", "id":
-2, "start": "2017-09-22T09:31:44.887Z", "name": "20170922093200",
-"parse": "818:818", "project": "my_rocko", "target":
-"core-image-minimal" }] } The JSON data for this query is returned in a
+To get the status of pending builds, use the following call::
+
+   http://host:port/toastergui/api/building
+
+Be sure to provide values for host and port. The output is a JSON file that
+itemizes all builds in progress. This file includes the time in seconds since
+each respective build started as well as the progress of the cloning, parsing,
+and task execution. The following is sample output for a build in progress:
+
+.. code-block:: JSON
+
+   {"count": 1,
+    "building": [
+      {"machine": "beaglebone",
+        "seconds": "463.869",
+        "task": "927:2384",
+        "distro": "poky",
+        "clone": "1:1",
+        "id": 2,
+        "start": "2017-09-22T09:31:44.887Z",
+        "name": "20170922093200",
+        "parse": "818:818",
+        "project": "my_rocko",
+        "target": "core-image-minimal"
+      }]
+   }
+
+The JSON data for this query is returned in a
 single line. In the previous example the line has been artificially
 split for readability.
 
@@ -377,14 +449,33 @@ Checking Status of Builds Completed
 -----------------------------------
 
 Once a build is completed, you get the status when you use the following
-call: http://host:port/toastergui/api/builds Be sure to provide values
-for host and port. The output is a JSON file that itemizes all complete
-builds, and includes build summary information. The following is sample
-output for a completed build: {"count": 1, "builds": [ {"distro":
-"poky", "errors": 0, "machine": "beaglebone", "project": "my_rocko",
-"stop": "2017-09-22T09:26:36.017Z", "target": "quilt-native", "seconds":
-"78.193", "outcome": "Succeeded", "id": 1, "start":
-"2017-09-22T09:25:17.824Z", "warnings": 1, "name": "20170922092618" }] }
+call::
+
+   http://host:port/toastergui/api/builds
+
+Be sure to provide values for host and port. The output is a JSON file that
+itemizes all complete builds, and includes build summary information. The
+following is sample output for a completed build:
+
+.. code-block:: JSON
+
+   {"count": 1,
+    "builds": [
+      {"distro": "poky",
+         "errors": 0,
+         "machine": "beaglebone",
+         "project": "my_rocko",
+         "stop": "2017-09-22T09:26:36.017Z",
+         "target": "quilt-native",
+         "seconds": "78.193",
+         "outcome": "Succeeded",
+         "id": 1,
+         "start": "2017-09-22T09:25:17.824Z",
+         "warnings": 1,
+         "name": "20170922092618"
+      }]
+   }
+
 The JSON data for this query is returned in a single line. In the
 previous example the line has been artificially split for readability.
 
@@ -392,22 +483,39 @@ Determining Status of a Specific Build
 --------------------------------------
 
 Sometimes it is useful to determine the status of a specific build. To
-get the status of a specific build, use the following call:
-http://host:port/toastergui/api/build/ID Be sure to provide values for
+get the status of a specific build, use the following call::
+
+   http://host:port/toastergui/api/build/ID
+
+Be sure to provide values for
 host, port, and ID. You can find the value for ID from the Builds
-Completed query. See the "`Checking Status of Builds
-Completed <#checking-status-of-builds-completed>`__" section for more
-information.
+Completed query. See the ":ref:`toaster-manual/toaster-manual-reference:checking status of builds completed`"
+section for more information.
 
 The output is a JSON file that itemizes the specific build and includes
 build summary information. The following is sample output for a specific
-build: {"build": {"distro": "poky", "errors": 0, "machine":
-"beaglebone", "project": "my_rocko", "stop": "2017-09-22T09:26:36.017Z",
-"target": "quilt-native", "seconds": "78.193", "outcome": "Succeeded",
-"id": 1, "start": "2017-09-22T09:25:17.824Z", "warnings": 1, "name":
-"20170922092618", "cooker_log":
-"/opt/user/poky/build-toaster-2/tmp/log/cooker/beaglebone/build_20170922_022607.991.log"
-} } The JSON data for this query is returned in a single line. In the
+build:
+
+.. code-block:: JSON
+
+   {"build":
+      {"distro": "poky",
+       "errors": 0,
+       "machine": "beaglebone",
+       "project": "my_rocko",
+       "stop": "2017-09-22T09:26:36.017Z",
+       "target": "quilt-native",
+       "seconds": "78.193",
+       "outcome": "Succeeded",
+       "id": 1,
+       "start": "2017-09-22T09:25:17.824Z",
+       "warnings": 1,
+       "name": "20170922092618",
+       "cooker_log": "/opt/user/poky/build-toaster-2/tmp/log/cooker/beaglebone/build_20170922_022607.991.log"
+      }
+   }
+
+The JSON data for this query is returned in a single line. In the
 previous example the line has been artificially split for readability.
 
 .. _toaster-useful-commands:
@@ -419,7 +527,7 @@ In addition to the web user interface and the scripts that start and
 stop Toaster, command-line commands exist through the ``manage.py``
 management script. You can find general documentation on ``manage.py``
 at the
-`Django <https://docs.djangoproject.com/en/1.7/topics/settings/>`__
+`Django <https://docs.djangoproject.com/en/2.2/topics/settings/>`__
 site. However, several ``manage.py`` commands have been created that are
 specific to Toaster and are used to control configuration and back-end
 tasks. You can locate these commands in the
@@ -446,19 +554,31 @@ tasks. You can locate these commands in the
 --------------
 
 The ``buildslist`` command lists all builds that Toaster has recorded.
-Access the command as follows: $ bitbake/lib/toaster/manage.py
-buildslist The command returns a list, which includes numeric
+Access the command as follows:
+
+.. code-block:: shell
+
+   $ bitbake/lib/toaster/manage.py buildslist
+
+The command returns a list, which includes numeric
 identifications, of the builds that Toaster has recorded in the current
 database.
 
 You need to run the ``buildslist`` command first to identify existing
 builds in the database before using the
-```builddelete`` <#toaster-command-builddelete>`__ command. Here is an
-example that assumes default repository and build directory names: $ cd
-~/poky/build $ python ../bitbake/lib/toaster/manage.py buildslist If
-your Toaster database had only one build, the above ``buildslist``
-command would return something like the following: 1: qemux86 poky
-core-image-minimal
+:ref:`toaster-manual/toaster-manual-reference:\`\`builddelete\`\`` command. Here is an
+example that assumes default repository and build directory names:
+
+.. code-block:: shell
+
+   $ cd ~/poky/build
+   $ python ../bitbake/lib/toaster/manage.py buildslist
+
+If your Toaster database had only one build, the above
+:ref:`toaster-manual/toaster-manual-reference:\`\`buildslist\`\``
+command would return something like the following::
+
+   1: qemux86 poky core-image-minimal
 
 .. _toaster-command-builddelete:
 
@@ -466,14 +586,19 @@ core-image-minimal
 ---------------
 
 The ``builddelete`` command deletes data associated with a build. Access
-the command as follows: $ bitbake/lib/toaster/manage.py builddelete
-build_id The command deletes all the build data for the specified
+the command as follows:
+
+.. code-block::
+
+   $ bitbake/lib/toaster/manage.py builddelete build_id
+
+The command deletes all the build data for the specified
 build_id. This command is useful for removing old and unused data from
 the database.
 
 Prior to running the ``builddelete`` command, you need to get the ID
 associated with builds by using the
-```buildslist`` <#toaster-command-buildslist>`__ command.
+:ref:`toaster-manual/toaster-manual-reference:\`\`buildslist\`\`` command.
 
 .. _toaster-command-perf:
 
@@ -481,9 +606,14 @@ associated with builds by using the
 --------
 
 The ``perf`` command measures Toaster performance. Access the command as
-follows: $ bitbake/lib/toaster/manage.py perf The command is a sanity
-check that returns page loading times in order to identify performance
-problems.
+follows:
+
+.. code-block:: shell
+
+   $ bitbake/lib/toaster/manage.py perf
+
+The command is a sanity check that returns page loading times in order to
+identify performance problems.
 
 .. _toaster-command-checksettings:
 
@@ -491,7 +621,12 @@ problems.
 -----------------
 
 The ``checksettings`` command verifies existing Toaster settings. Access
-the command as follows: $ bitbake/lib/toaster/manage.py checksettings
+the command as follows:
+
+.. code-block:: shell
+
+   $ bitbake/lib/toaster/manage.py checksettings
+
 Toaster uses settings that are based on the database to configure the
 building tasks. The ``checksettings`` command verifies that the database
 settings are valid in the sense that they have the minimal information
@@ -499,10 +634,15 @@ needed to start a build.
 
 In order for the ``checksettings`` command to work, the database must be
 correctly set up and not have existing data. To be sure the database is
-ready, you can run the following: $ bitbake/lib/toaster/mana​ge.py
-syncdb $ bitbake/lib/toaster/mana​ge.py migrate orm $
-bitbake/lib/toaster/mana​ge.py migrate bldcontrol After running these
-commands, you can run the ``checksettings`` command.
+ready, you can run the following:
+
+.. code-block:: shell
+
+   $ bitbake/lib/toaster/manage.py syncdb
+   $ bitbake/lib/toaster/manage.py migrate orm
+   $ bitbake/lib/toaster/manage.py migrate bldcontrol
+
+After running these commands, you can run the ``checksettings`` command.
 
 .. _toaster-command-runbuilds:
 
@@ -510,8 +650,13 @@ commands, you can run the ``checksettings`` command.
 -------------
 
 The ``runbuilds`` command launches scheduled builds. Access the command
-as follows: $ bitbake/lib/toaster/manage.py runbuilds The ``runbuilds``
-command checks if scheduled builds exist in the database and then
-launches them per schedule. The command returns after the builds start
-but before they complete. The Toaster Logging Interface records and
+as follows:
+
+.. code-block:: shell
+
+   $ bitbake/lib/toaster/manage.py runbuilds
+
+The ``runbuilds`` command checks if scheduled builds exist in the database
+and then launches them per schedule. The command returns after the builds
+start but before they complete. The Toaster Logging Interface records and
 updates the database when the builds complete.
diff --git a/documentation/toaster-manual/toaster-manual-setup-and-use.rst b/documentation/toaster-manual/toaster-manual-setup-and-use.rst
index 1ff28395f..1da46918d 100644
--- a/documentation/toaster-manual/toaster-manual-setup-and-use.rst
+++ b/documentation/toaster-manual/toaster-manual-setup-and-use.rst
@@ -8,28 +8,52 @@ Starting Toaster for Local Development
 ======================================
 
 Once you have set up the Yocto Project and installed the Toaster system
-dependencies as described in the "`Preparing to Use
-Toaster <#toaster-manual-start>`__" chapter, you are ready to start
+dependencies as described in the ":ref:`toaster-manual/toaster-manual-start:Preparing to Use
+Toaster`" chapter, you are ready to start
 Toaster.
 
 Navigate to the root of your
-:term:`Source Directory` (e.g. ``poky``): $
-cd poky Once in that directory, source the build environment script: $
-source oe-init-build-env Next, from the build directory (e.g.
-``poky/build``), start Toaster using this command: $ source toaster
-start You can now run your builds from the command line, or with Toaster
-as explained in section "`Using the Toaster Web
-Interface <#using-the-toaster-web-interface>`__".
+:term:`Source Directory` (e.g. ``poky``):
+
+.. Set default pygment highlighting to 'shell' for this document
+
+.. highlight:: shell
+.. code-block::
+
+   $ cd poky
+
+Once in that directory, source the build environment script:
+
+.. code-block::
+
+   $ source oe-init-build-env
+
+Next, from the build directory (e.g.
+``poky/build``), start Toaster using this command:
+
+.. code-block::
+
+   $ source toaster start
+
+You can now run your builds from the command line, or with Toaster
+as explained in section
+":ref:`toaster-manual/toaster-manual-setup-and-use:using the toaster web interface`".
 
 To access the Toaster web interface, open your favorite browser and
-enter the following: http://127.0.0.1:8000
+enter the following::
+
+   http://127.0.0.1:8000
 
 Setting a Different Port
 ========================
 
 By default, Toaster starts on port 8000. You can use the ``WEBPORT``
 parameter to set a different port. For example, the following command
-sets the port to "8400": $ source toaster start webport=8400
+sets the port to "8400":
+
+.. code-block::
+
+   $ source toaster start webport=8400
 
 Setting Up Toaster Without a Web Server
 =======================================
@@ -54,8 +78,13 @@ Toaster environment. Before closing the environment, however, you should
 allow a few minutes to ensure the complete transfer of its BitBake build
 statistics to the Toaster database. If you have a separate Toaster web
 server instance running, you can watch this command-line build’s
-progress and examine the results as soon as they are posted: $ source
-toaster start noweb $ bitbake target $ source toaster stop
+progress and examine the results as soon as they are posted:
+
+.. code-block::
+
+   $ source toaster start noweb
+   $ bitbake target
+   $ source toaster stop
 
 Setting Up Toaster Without a Build Server
 =========================================
@@ -69,23 +98,33 @@ disabled. Doing so is useful for the following:
 -  Allowing only local command-line builds to be captured into the
    Toaster database.
 
-Use the following command to set up Toaster without a build server: $
-source toaster start nobuild webport=port
+Use the following command to set up Toaster without a build server:
+
+.. code-block::
+
+   $ source toaster start nobuild webport=port
 
 Setting up External Access
 ==========================
 
-By default, Toaster binds to the loop back address (i.e. localhost),
+By default, Toaster binds to the loop back address (i.e. ``localhost``),
 which does not allow access from external hosts. To allow external
 access, use the ``WEBPORT`` parameter to open an address that connects
 to the network, specifically the IP address that your NIC uses to
 connect to the network. You can also bind to all IP addresses the
 computer supports by using the shortcut "0.0.0.0:port".
 
-The following example binds to all IP addresses on the host: $ source
-toaster start webport=0.0.0.0:8400 This example binds to a specific IP
-address on the host's NIC: $ source toaster start
-webport=192.168.1.1:8400
+The following example binds to all IP addresses on the host:
+
+.. code-block::
+
+   $ source toaster start webport=0.0.0.0:8400
+
+This example binds to a specific IP address on the host's NIC:
+
+.. code-block::
+
+   $ source toaster start webport=192.168.1.1:8400
 
 The Directory for Cloning Layers
 ================================
@@ -126,34 +165,47 @@ parameters.
 To access the Django administration interface, you must create a
 superuser by following these steps:
 
-1. If you used ``pip3``, which is recommended, to set up the Toaster
+#. If you used ``pip3``, which is recommended, to set up the Toaster
    system dependencies, you need be sure the local user path is in your
    ``PATH`` list. To append the pip3 local user path, use the following
-   command: $ export PATH=$PATH:$HOME/.local/bin
+   command:
+
+   .. code-block::
+
+      $ export PATH=$PATH:$HOME/.local/bin
 
-2. From the directory containing the Toaster database, which by default
+#. From the directory containing the Toaster database, which by default
    is the :term:`Build Directory`,
-   invoke the ``createsuperuser`` command from ``manage.py``: $ cd
-   ~/poky/build $ ../bitbake/lib/toaster/manage.py createsuperuser
+   invoke the ``createsuperuser`` command from ``manage.py``:
 
-3. Django prompts you for the username, which you need to provide.
+   .. code-block::
 
-4. Django prompts you for an email address, which is optional.
+      $ cd ~/poky/build
+      $ ../bitbake/lib/toaster/manage.py createsuperuser
 
-5. Django prompts you for a password, which you must provide.
+#. Django prompts you for the username, which you need to provide.
 
-6. Django prompts you to re-enter your password for verification.
+#. Django prompts you for an email address, which is optional.
+
+#. Django prompts you for a password, which you must provide.
+
+#. Django prompts you to re-enter your password for verification.
 
 After completing these steps, the following confirmation message
-appears: Superuser created successfully.
+appears::
+
+   Superuser created successfully.
 
 Creating a superuser allows you to access the Django administration
 interface through a browser. The URL for this interface is the same as
 the URL used for the Toaster instance with "/admin" on the end. For
-example, if you are running Toaster locally, use the following URL:
-http://127.0.0.1:8000/admin You can use the Django administration
-interface to set Toaster configuration parameters such as the build
-directory, layer sources, default variable values, and BitBake versions.
+example, if you are running Toaster locally, use the following URL::
+
+   http://127.0.0.1:8000/admin
+
+You can use the Django administration interface to set Toaster configuration
+parameters such as the build directory, layer sources, default variable
+values, and BitBake versions.
 
 .. _toaster-setting-up-a-production-instance-of-toaster:
 
@@ -175,12 +227,10 @@ Be sure you meet the following requirements:
 
 .. note::
 
-   You must comply with all Apache,
-   mod-wsgi
-   , and Mysql requirements.
+   You must comply with all Apache, ``mod-wsgi``, and Mysql requirements.
 
--  Have all the build requirements as described in the "`Preparing to
-   Use Toaster <#toaster-manual-start>`__" chapter.
+-  Have all the build requirements as described in the ":ref:`toaster-manual/toaster-manual-start:Preparing to
+   Use Toaster`" chapter.
 
 -  Have an Apache webserver.
 
@@ -188,17 +238,24 @@ Be sure you meet the following requirements:
 
 -  Use the Mysql database server.
 
--  If you are using Ubuntu 16.04, run the following: $ sudo apt-get
-   install apache2 libapache2-mod-wsgi-py3 mysql-server python3-pip
-   libmysqlclient-dev
+-  If you are using Ubuntu, run the following:
+
+   .. code-block::
 
--  If you are using Fedora 24 or a RedHat distribution, run the
-   following: $ sudo dnf install httpd python3-mod_wsgi python3-pip
-   mariadb-server mariadb-devel python3-devel
+      $ sudo apt-get install apache2 libapache2-mod-wsgi-py3 mysql-server python3-pip libmysqlclient-dev
 
--  If you are using openSUSE Leap 42.1, run the following: $ sudo zypper
-   install apache2 apache2-mod_wsgi-python3 python3-pip mariadb
-   mariadb-client python3-devel
+-  If you are using Fedora or a RedHat distribution, run the
+   following:
+
+   .. code-block::
+
+      $ sudo dnf install httpd python3-mod_wsgi python3-pip mariadb-server mariadb-devel python3-devel
+
+-  If you are using openSUSE, run the following:
+
+   .. code-block::
+
+      $ sudo zypper install apache2 apache2-mod_wsgi-python3 python3-pip mariadb mariadb-client python3-devel
 
 .. _toaster-installation-steps:
 
@@ -207,19 +264,30 @@ Installation
 
 Perform the following steps to install Toaster:
 
-1.  Create toaster user and set its home directory to
-    ``/var/www/toaster``: $ sudo /usr/sbin/useradd toaster -md
-    /var/www/toaster -s /bin/false $ sudo su - toaster -s /bin/bash
+#.  Create toaster user and set its home directory to
+    ``/var/www/toaster``:
+
+    .. code-block::
 
-2.  Checkout a copy of ``poky`` into the web server directory. You will
-    be using ``/var/www/toaster``: $ git clone
-    git://git.yoctoproject.org/poky $ git checkout DISTRO_NAME_NO_CAP
+      $ sudo /usr/sbin/useradd toaster -md /var/www/toaster -s /bin/false
+      $ sudo su - toaster -s /bin/bash
 
-3.  Install Toaster dependencies using the --user flag which keeps the
-    Python packages isolated from your system-provided packages: $ cd
-    /var/www/toaster/ $ pip3 install --user -r
-    ./poky/bitbake/toaster-requirements.txt $ pip3 install --user
-    mysqlclient
+#.  Checkout a copy of ``poky`` into the web server directory. You will
+    be using ``/var/www/toaster``:
+
+    .. code-block::
+
+      $ git clone git://git.yoctoproject.org/poky
+      $ git checkout &DISTRO_NAME_NO_CAP;
+
+#.  Install Toaster dependencies using the --user flag which keeps the
+    Python packages isolated from your system-provided packages:
+
+    .. code-block::
+
+      $ cd /var/www/toaster/
+      $ pip3 install --user -r ./poky/bitbake/toaster-requirements.txt
+      $ pip3 install --user mysqlclient
 
     .. note::
 
@@ -227,35 +295,64 @@ Perform the following steps to install Toaster:
        Alternatively, you can use your operating system's package
        manager to install the packages.
 
-4.  Configure Toaster by editing
+#.  Configure Toaster by editing
     ``/var/www/toaster/poky/bitbake/lib/toaster/toastermain/settings.py``
     as follows:
 
     -  Edit the
-       `DATABASES <https://docs.djangoproject.com/en/1.11/ref/settings/#databases>`__
-       settings: DATABASES = { 'default': { 'ENGINE':
-       'django.db.backends.mysql', 'NAME': 'toaster_data', 'USER':
-       'toaster', 'PASSWORD': 'yourpasswordhere', 'HOST': 'localhost',
-       'PORT': '3306', } }
+       `DATABASES <https://docs.djangoproject.com/en/2.2/ref/settings/#databases>`__
+       settings:
+
+       .. code-block:: python
+
+         DATABASES = {
+            'default': {
+               'ENGINE': 'django.db.backends.mysql',
+               'NAME': 'toaster_data',
+               'USER': 'toaster',
+               'PASSWORD': 'yourpasswordhere',
+               'HOST': 'localhost',
+               'PORT': '3306',
+            }
+         }
 
     -  Edit the
-       `SECRET_KEY <https://docs.djangoproject.com/en/1.11/ref/settings/#std:setting-SECRET_KEY>`__:
-       SECRET_KEY = 'your_secret_key'
+       `SECRET_KEY <https://docs.djangoproject.com/en/2.2/ref/settings/#std:setting-SECRET_KEY>`__:
+
+       .. code-block:: python
+
+         SECRET_KEY = 'your_secret_key'
 
     -  Edit the
-       `STATIC_ROOT <https://docs.djangoproject.com/en/1.11/ref/settings/#std:setting-STATIC_ROOT>`__:
-       STATIC_ROOT = '/var/www/toaster/static_files/'
-
-5.  Add the database and user to the ``mysql`` server defined earlier: $
-    mysql -u root -p mysql> CREATE DATABASE toaster_data; mysql> CREATE
-    USER 'toaster'@'localhost' identified by 'yourpasswordhere'; mysql>
-    GRANT all on toaster_data.\* to 'toaster'@'localhost'; mysql> quit
-
-6.  Get Toaster to create the database schema, default data, and gather
-    the statically-served files: $ cd /var/www/toaster/poky/ $
-    ./bitbake/lib/toaster/manage.py migrate $ TOASTER_DIR=`pwd\`
-    TEMPLATECONF='poky' \\ ./bitbake/lib/toaster/manage.py checksettings
-    $ ./bitbake/lib/toaster/manage.py collectstatic In the previous
+       `STATIC_ROOT <https://docs.djangoproject.com/en/2.2/ref/settings/#std:setting-STATIC_ROOT>`__:
+
+      .. code-block:: python
+
+         STATIC_ROOT = '/var/www/toaster/static_files/'
+
+#.  Add the database and user to the ``mysql`` server defined earlier:
+
+    .. code-block::
+
+      $ mysql -u root -p
+      mysql> CREATE DATABASE toaster_data;
+      mysql> CREATE USER 'toaster'@'localhost' identified by 'yourpasswordhere';
+      mysql> GRANT all on toaster_data.\* to 'toaster'@'localhost';
+      mysql> quit
+
+#.  Get Toaster to create the database schema, default data, and gather
+    the statically-served files:
+
+    .. code-block::
+
+      $ cd /var/www/toaster/poky/
+      $ ./bitbake/lib/toaster/manage.py migrate
+      $ TOASTER_DIR=`pwd\` TEMPLATECONF='poky' \
+         ./bitbake/lib/toaster/manage.py checksettings
+      $ ./bitbake/lib/toaster/manage.py collectstatic
+
+
+    In the previous
     example, from the ``poky`` directory, the ``migrate`` command
     ensures the database schema changes have propagated correctly (i.e.
     migrations). The next line sets the Toaster root directory
@@ -264,80 +361,160 @@ Perform the following steps to install Toaster:
     ``TEMPLATECONF`` value reflects the contents of
     ``poky/.templateconf``, and by default, should include the string
     "poky". For more information on the Toaster configuration file, see
-    the "`Configuring Toaster <#configuring-toaster>`__" section.
+    the ":ref:`toaster-manual/toaster-manual-reference:Configuring Toaster`" section.
 
     This line also runs the ``checksettings`` command, which configures
     the location of the Toaster :term:`Build Directory`.
     The Toaster
     root directory ``TOASTER_DIR`` determines where the Toaster build
     directory is created on the file system. In the example above,
-    ``TOASTER_DIR`` is set as follows: /var/www/toaster/poky This
-    setting causes the Toaster build directory to be:
-    /var/www/toaster/poky/build
+    ``TOASTER_DIR`` is set as follows::
+
+       /var/www/toaster/poky
+
+
+    This setting causes the Toaster build directory to be::
+
+       /var/www/toaster/poky/build
 
     Finally, the ``collectstatic`` command is a Django framework command
     that collects all the statically served files into a designated
     directory to be served up by the Apache web server as defined by
     ``STATIC_ROOT``.
 
-7.  Test and/or use the Mysql integration with Toaster’s Django web
+#.  Test and/or use the Mysql integration with Toaster’s Django web
     server. At this point, you can start up the normal Toaster Django
     web server with the Toaster database in Mysql. You can use this web
     server to confirm that the database migration and data population
     from the Layer Index is complete.
 
     To start the default Toaster Django web server with the Toaster
-    database now in Mysql, use the standard start commands: $ source
-    oe-init-build-env $ source toaster start Additionally, if Django is
-    sufficient for your requirements, you can use it for your release
-    system and migrate later to Apache as your requirements change.
+    database now in Mysql, use the standard start commands:
+
+    .. code-block::
+
+      $ source oe-init-build-env
+      $ source toaster start
 
-8.  Add an Apache configuration file for Toaster to your Apache web
+
+    Additionally, if Django is sufficient for your requirements, you can use
+    it for your release system and migrate later to Apache as your
+    requirements change.
+
+#.  Add an Apache configuration file for Toaster to your Apache web
     server's configuration directory. If you are using Ubuntu or Debian,
-    put the file here: /etc/apache2/conf-available/toaster.conf If you
-    are using Fedora or RedHat, put it here:
-    /etc/httpd/conf.d/toaster.conf If you are using OpenSUSE, put it
-    here: /etc/apache2/conf.d/toaster.conf Following is a sample Apache
-    configuration for Toaster you can follow: Alias /static
-    /var/www/toaster/static_files <Directory
-    /var/www/toaster/static_files> <IfModule mod_access_compat.c> Order
-    allow,deny Allow from all </IfModule> <IfModule
-    !mod_access_compat.c> Require all granted </IfModule> </Directory>
-    <Directory /var/www/toaster/poky/bitbake/lib/toaster/toastermain>
-    <Files "wsgi.py"> Require all granted </Files> </Directory>
-    WSGIDaemonProcess toaster_wsgi
-    python-path=/var/www/toaster/poky/bitbake/lib/toaster:/var/www/toaster/.local/lib/python3.4/site-packages
-    WSGIScriptAlias /
-    "/var/www/toaster/poky/bitbake/lib/toaster/toastermain/wsgi.py"
-    <Location /> WSGIProcessGroup toaster_wsgi </Location> If you are
-    using Ubuntu or Debian, you will need to enable the config and
-    module for Apache: $ sudo a2enmod wsgi $ sudo a2enconf toaster $
-    chmod +x bitbake/lib/toaster/toastermain/wsgi.py Finally, restart
-    Apache to make sure all new configuration is loaded. For Ubuntu,
-    Debian, and OpenSUSE use: $ sudo service apache2 restart For Fedora
-    and RedHat use: $ sudo service httpd restart
-
-9.  Prepare the systemd service to run Toaster builds. Here is a sample
-    configuration file for the service: [Unit] Description=Toaster
-    runbuilds [Service] Type=forking User=toaster
-    ExecStart=/usr/bin/screen -d -m -S runbuilds
-    /var/www/toaster/poky/bitbake/lib/toaster/runbuilds-service.sh start
-    ExecStop=/usr/bin/screen -S runbuilds -X quit
-    WorkingDirectory=/var/www/toaster/poky [Install]
-    WantedBy=multi-user.target Prepare the ``runbuilds-service.sh``
-    script that you need to place in the
+    put the file here::
+
+      /etc/apache2/conf-available/toaster.conf
+
+
+    If you are using Fedora or RedHat, put it here::
+
+      /etc/httpd/conf.d/toaster.conf
+
+    If you are using OpenSUSE, put it here::
+
+      /etc/apache2/conf.d/toaster.conf
+
+    Following is a sample Apache configuration for Toaster you can follow:
+
+    .. code-block:: apache
+
+      Alias /static /var/www/toaster/static_files
+      <Directory /var/www/toaster/static_files>
+         <IfModule mod_access_compat.c>
+            Order allow,deny
+            Allow from all
+         </IfModule>
+         <IfModule !mod_access_compat.c>
+            Require all granted
+         </IfModule>
+      </Directory>
+    
+      <Directory /var/www/toaster/poky/bitbake/lib/toaster/toastermain>
+         <Files "wsgi.py">
+            Require all granted
+         </Files>
+      </Directory>
+    
+      WSGIDaemonProcess toaster_wsgi python-path=/var/www/toaster/poky/bitbake/lib/toaster:/var/www/toaster/.local/lib/python3.4/site-packages
+      WSGIScriptAlias / "/var/www/toaster/poky/bitbake/lib/toaster/toastermain/wsgi.py"
+      <Location />
+         WSGIProcessGroup toaster_wsgi
+      </Location>
+
+
+    If you are using Ubuntu or Debian, you will need to enable the config and
+    module for Apache:
+
+    .. code-block::
+
+      $ sudo a2enmod wsgi
+      $ sudo a2enconf toaster
+      $ chmod +x bitbake/lib/toaster/toastermain/wsgi.py
+
+    Finally, restart Apache to make sure all new configuration is loaded. For Ubuntu,
+    Debian, and OpenSUSE use:
+
+    .. code-block::
+
+      $ sudo service apache2 restart
+
+    For Fedora and RedHat use:
+
+    .. code-block::
+
+      $ sudo service httpd restart
+
+#.  Prepare the systemd service to run Toaster builds. Here is a sample
+    configuration file for the service:
+
+    .. code-block:: ini
+
+      [Unit]
+      Description=Toaster runbuilds
+      
+      [Service]
+      Type=forking User=toaster
+      ExecStart=/usr/bin/screen -d -m -S runbuilds /var/www/toaster/poky/bitbake/lib/toaster/runbuilds-service.sh start
+      ExecStop=/usr/bin/screen -S runbuilds -X quit
+      WorkingDirectory=/var/www/toaster/poky
+      
+      [Install]
+      WantedBy=multi-user.target
+
+
+    Prepare the ``runbuilds-service.sh`` script that you need to place in the
     ``/var/www/toaster/poky/bitbake/lib/toaster/`` directory by setting
-    up executable permissions: #!/bin/bash #export
-    http_proxy=http://proxy.host.com:8080 #export
-    https_proxy=http://proxy.host.com:8080 #export
-    GIT_PROXY_COMMAND=$HOME/bin/gitproxy cd ~/poky/ source
-    ./oe-init-build-env build source ../bitbake/bin/toaster $1 noweb [
-    "$1" == 'start' ] && /bin/bash
-
-10. Run the service: # service runbuilds start Since the service is
-    running in a detached screen session, you can attach to it using
-    this command: $ sudo su - toaster $ screen -rS runbuilds You can
-    detach from the service again using "Ctrl-a" followed by "d" key
+    up executable permissions:
+
+    .. code-block::
+
+      #!/bin/bash
+      
+      #export http_proxy=http://proxy.host.com:8080
+      #export https_proxy=http://proxy.host.com:8080
+      #export GIT_PROXY_COMMAND=$HOME/bin/gitproxy
+      cd ~/poky/
+      source ./oe-init-build-env build
+      source ../bitbake/bin/toaster $1 noweb
+      [ "$1" == 'start' ] && /bin/bash
+
+#.  Run the service:
+
+    .. code-block::
+
+       $ sudo service runbuilds start
+
+    Since the service is running in a detached screen session, you can
+    attach to it using this command:
+
+    .. code-block::
+
+       $ sudo su - toaster
+       $ screen -rS runbuilds
+
+    You can detach from the service again using "Ctrl-a" followed by "d" key
     combination.
 
 You can now open up a browser and start using Toaster.
@@ -432,8 +609,9 @@ Additional Information About the Local Yocto Project Release
 ------------------------------------------------------------
 
 This section only applies if you have set up Toaster for local
-development, as explained in the "`Starting Toaster for Local
-Development <#starting-toaster-for-local-development>`__" section.
+development, as explained in the
+":ref:`toaster-manual/toaster-manual-setup-and-use:starting toaster for local development`"
+section.
 
 When you create a project in Toaster, you will be asked to provide a
 name and to select a Yocto Project release. One of the release options
diff --git a/documentation/toaster-manual/toaster-manual-start.rst b/documentation/toaster-manual/toaster-manual-start.rst
index 1114c04ea..62e113e3a 100644
--- a/documentation/toaster-manual/toaster-manual-start.rst
+++ b/documentation/toaster-manual/toaster-manual-start.rst
@@ -14,11 +14,16 @@ Setting Up the Basic System Requirements
 
 Before you can use Toaster, you need to first set up your build system
 to run the Yocto Project. To do this, follow the instructions in the
-"`Preparing the Build
-Host <&YOCTO_DOCS_DEV_URL;#dev-preparing-the-build-host>`__" section of
+":ref:`dev-manual/dev-manual-start:preparing the build host`" section of
 the Yocto Project Development Tasks Manual. For Ubuntu/Debian, you might
-also need to do an additional install of pip3. $ sudo apt-get install
-python3-pip
+also need to do an additional install of pip3.
+
+.. Set default pygments highlighting to shell for this document
+
+.. highlight:: shell
+.. code-block::
+
+   $ sudo apt-get install python3-pip
 
 .. _toaster-establishing-toaster-system-dependencies:
 
@@ -39,10 +44,23 @@ Install Toaster Packages
 ------------------------
 
 You need to install the packages that Toaster requires. Use this
-command: $ pip3 install --user -r bitbake/toaster-requirements.txt The
-previous command installs the necessary Toaster modules into a local
+command:
+
+.. code-block::
+
+   $ pip3 install --user -r bitbake/toaster-requirements.txt
+
+The previous command installs the necessary Toaster modules into a local
 python 3 cache in your ``$HOME`` directory. The caches is actually
 located in ``$HOME/.local``. To see what packages have been installed
-into your ``$HOME`` directory, do the following: $ pip3 list installed
---local If you need to remove something, the following works: $ pip3
-uninstall PackageNameToUninstall
+into your ``$HOME`` directory, do the following:
+
+.. code-block::
+
+   $ pip3 list installed --local
+
+If you need to remove something, the following works:
+
+.. code-block::
+
+   $ pip3 uninstall PackageNameToUninstall
-- 
2.25.0

