Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
 by mx.groups.io with SMTP id smtpd.web09.21775.1627638324462740579
 for <docs@lists.yoctoproject.org>;
 Fri, 30 Jul 2021 02:45:25 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: bootlin.com, ip: 217.70.183.200, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id 88A0020014;
	Fri, 30 Jul 2021 09:45:22 +0000 (UTC)
From: "Michael Opdenacker" <michael.opdenacker@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>,
	Quentin Schulz <foss@0leil.net>,
	Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [PATCH v2] migration-guides: Add start of 3.4 guide with override migration notes
Date: Fri, 30 Jul 2021 11:45:20 +0200
Message-Id: <20210730094520.177302-1-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <16968778436D0C00.13113@lists.yoctoproject.org>
References: <16968778436D0C00.13113@lists.yoctoproject.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Richard Purdie <richard.purdie@linuxfoundation.org>

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Reviewed-by: Quentin Schulz <foss@0leil.net>
Reviewed-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 documentation/migration-guides/index.rst      |  1 +
 .../migration-guides/migration-3.4.rst        | 72 +++++++++++++++++++
 2 files changed, 73 insertions(+)
 create mode 100644 documentation/migration-guides/migration-3.4.rst

diff --git a/documentation/migration-guides/index.rst b/documentation/migration-guides/index.rst
index 6304e6318c..287b553195 100644
--- a/documentation/migration-guides/index.rst
+++ b/documentation/migration-guides/index.rst
@@ -12,6 +12,7 @@ to move to one release of the Yocto Project from the previous one.
 .. toctree::
 
    migration-general
+   migration-3.4
    migration-3.3
    migration-3.2
    migration-3.1
diff --git a/documentation/migration-guides/migration-3.4.rst b/documentation/migration-guides/migration-3.4.rst
new file mode 100644
index 0000000000..45ce38cd6d
--- /dev/null
+++ b/documentation/migration-guides/migration-3.4.rst
@@ -0,0 +1,72 @@
+Release 3.4 (honister)
+======================
+
+This section provides migration information for moving to the Yocto
+Project 3.4 Release (codename "honister") from the prior release.
+
+Override syntax changes
+-----------------------
+
+This release requires changes to the metadata to indicate where overrides are
+being used in variable key names. This is done with the ":" character replacing
+the use of "_" previously. This means that an entry like::
+
+   SRC_URI_qemux86 = "file://somefile"
+
+becomes::
+
+   SRC_URI:qemux86 = " file://somefile"
+
+since qemux86 is an override. This applies to any use of override syntax so::
+
+   SRC_URI_append = " file://somefile"
+   SRC_URI_append_qemux86 = " file://somefile2"
+   SRC_URI_remove_qemux86-64 = " file://somefile3"
+   SRC_URI_prepend_qemuarm = "file://somefile4 "
+   FILES_${PN}-ptest = "${bindir}/xyz"
+   IMAGE_CMD_tar = "tar"
+   BASE_LIB_tune-coretexa76 = "lib"
+   SRCREV_pn-bash = "abc"
+   BB_TASK_NICE_LEVEL_task-testimage = '0'
+
+becomes::
+
+   SRC_URI:append = " file://somefile"
+   SRC_URI:append:qemux86 = " file://somefile2"
+   SRC_URI:remove:qemux86-64 = " file://somefile3"
+   SRC_URI:prepend:qemuarm = "file://somefile4 "
+   FILES:${PN}-ptest = "${bindir}/xyz"
+   IMAGE_CMD:tar = "tar"
+   BASE_LIB:tune-coretexa76 = "lib"
+   SRCREV:pn-bash = "abc"
+   BB_TASK_NICE_LEVEL:task-testimage = '0'
+
+This also applies to variable queries to the datastore, for example using getVar 
+and similar so d.getVar("RDEPENDS_${PN}") becomes d.getVar("RDEPENDS:${PN}").
+
+Whilst some of these are fairly obvious such as MACHINE and DISTRO overrides, some
+are less obvious, for example the packaging variables such as RDEPENDS, FILES and 
+so on taking package names (e.g. ${PN}, ${PN}-ptest) as overrides. These overrides 
+are not always applies in OVERRIDES but applied conditionally in specific contexts
+such as packaging. The task-<taskname> is another context specific override, the 
+context being specific tasks in that case. Tune overrides are another specialist
+case where some code does use them as overrides but some does not. We plan to try
+and make the tune code use overrides more consistently in the future.
+
+To help with migration of layers there is a script in OE-Core. Once configured
+with the overrides used by a layer, this can be run as::
+
+   <oe-core>/scripts/contrib/convert-overrides.py <layerdir>
+
+Please read the notes in the script as it isn't entirely automatic and it isn't
+expected to handle every case. In particular, it needs to be told which overrides
+the layer uses (usually machine and distro names/overrides) and the result should
+be carefully checked since it can be a little enthusiastic and will convert
+references to "_append", "_remove" and "_prepend" in function and variables names.
+
+For reference, this conversion is important as it allows bitbake to know what is
+an override and what is not. This should allow us to proceed with other syntax
+improvements and simplifications for usability. It also means bitbake no longer
+has to guess and maintain large lookup lists just in case "functionname" in
+"my_functionname" is an override and this should improve efficiency.
+
-- 
2.25.1

