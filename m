Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8FCCE776DC
	for <webhook@archiver.kernel.org>; Wed, 24 Dec 2025 16:32:13 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.123205.1766593931329256963
 for <docs@lists.yoctoproject.org>;
 Wed, 24 Dec 2025 08:32:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=eP+bfCor;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id D23A41A23E0
	for <docs@lists.yoctoproject.org>; Wed, 24 Dec 2025 16:32:09 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id A92C96073D
	for <docs@lists.yoctoproject.org>; Wed, 24 Dec 2025 16:32:09 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 9746610AB138D;
	Wed, 24 Dec 2025 17:32:08 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1766593929; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=nKYnosNRceZWcnrrqUB73rHteYrs9lpNxgCT75LWylQ=;
	b=eP+bfCorYY+eP6A8ARvVY2hZw9AZfIEKVoBTqcpTzhSv/f+1cBARy9MOMcrP/vALb7YZCr
	gSi9Uo8/svwYgfF7XgHkN9MMW2h9gYzBmBtIzrA/jgK695AQtp3yvLXlmSFzo2ZzKbN8NY
	UWlmJtjsy5f67H8bIxOyiNLnhsqmZuVV0ZJjfeCZ7PNkt9DAL/j7r2v3QV9VmsPXQ0ZDke
	YrgiZw3tYUeHqvWx1VwYgJIJ5YDH5lnNnmOV7baFbJOc+nhkcuwKiKNhSZwibKw79gRFCJ
	fz2BVsO3WIqcNCjGlRCccaZJaM84+7A46HejBBvGRXJ05mlLxjSsstHFGjJJgQ==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Wed, 24 Dec 2025 17:31:58 +0100
Subject: [PATCH 32/53] toaster-manual: remove obsolete poky repo references
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251224-remove-poky-references-v1-32-658a5f4dbde2@bootlin.com>
References: <20251224-remove-poky-references-v1-0-658a5f4dbde2@bootlin.com>
In-Reply-To: <20251224-remove-poky-references-v1-0-658a5f4dbde2@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=10866;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=CBQksE9kWZ6YhL7f79cjiPY/GjtSbydq9nB/HlDE2x0=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBpTBVsz7ceDGsUJlamAnob9tYSeCXPIYymylt9m
 OMtSwhSHNaJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCaUwVbAAKCRDRgEFAKaOo
 Ns3KEACf+ODH009QtLIX8z3Y6JIgAli6nr4pgaOaZO1WTJROZaZ0Ex0njaVWS8f98ebk7rDQkbB
 q4GJL5hJox04iIgmKk1KQKU1Hx9iDE9YVPFkqku5a313xs2/As+bzrzuPV0ORIax07NxO1hbUhu
 oc4h88H2KzaWwFWy/ZzOtvMx8h8OemFpCuVO0Esyq1nUdy2EC7qGX23HXa27A8bLCK8YvAppfsg
 AL8whvH1ppY10oMuWV0uU89oqwMqEwTbv5wagInaaqYKwIHqllycIY1PrAqpvz3uIyB52ix7V7P
 vRSJPue0UqtYCoCNigx95/lM1GXxv4o8UrwOQSazsQzUplE4tos+na5Ac16dWqHVi+pG24meZMf
 oSufbxcZ7XMaSLaBk9H3518g3H4Waw4sjTOpshcv0wcuU6jRZnplcetdyirukHrNYnm+3WO57IR
 CgdWovHOJG/NEorkOEzPHn04BZ1v9LMHxnACgHxVEmCHhwZOPrGHrCjKsaPyCNbQdiKAHqiTOmn
 SUKhtPfx8o51NaNjl0iHNhWSM3K85kb7LVYelz+CzL1sTh39gOoa7QYY6SWdHnvuWIYxOY/Sof2
 UpsfFAKDweahCrKv+3hNF4dapcXdKclZCXpQ0+xPeNORXTLW5D5a2CYHvzWSw9o2yPW1B9ubSJu
 iuJ80yoS3eK3ihA==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 24 Dec 2025 16:32:13 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8361

Adapt the Toaster documentation after the Poky became obsolete.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/toaster-manual/reference.rst     | 12 +++---
 documentation/toaster-manual/setup-and-use.rst | 56 ++++++++++++++------------
 documentation/toaster-manual/start.rst         |  6 +--
 3 files changed, 37 insertions(+), 37 deletions(-)

diff --git a/documentation/toaster-manual/reference.rst b/documentation/toaster-manual/reference.rst
index 3050b5d0f5..4dbcda37ff 100644
--- a/documentation/toaster-manual/reference.rst
+++ b/documentation/toaster-manual/reference.rst
@@ -161,16 +161,15 @@ As shipped, Toaster is configured to work with the following releases:
 -  *Yocto Project &DISTRO; "&DISTRO_NAME;" or OpenEmbedded "&DISTRO_NAME;":*
    This release causes your Toaster projects to build against the head
    of the &DISTRO_NAME_NO_CAP; branch at
-   :yocto_git:`/poky/log/?h=&DISTRO_NAME_NO_CAP;` or
    :oe_git:`/openembedded-core/commit/?h=&DISTRO_NAME_NO_CAP;`.
 
 -  *Yocto Project "Master" or OpenEmbedded "Master":* This release
    causes your Toaster Projects to build against the head of the master
    branch, which is where active development takes place, at
-   :yocto_git:`/poky/log/` or :oe_git:`/openembedded-core/log/`.
+   :oe_git:`/openembedded-core/log/`.
 
 -  *Local Yocto Project or Local OpenEmbedded:* This release causes your
-   Toaster Projects to build against the head of the ``poky`` or
+   Toaster Projects to build against the head of the
    ``openembedded-core`` clone you have local to the machine running
    Toaster.
 
@@ -277,7 +276,7 @@ release selection:
    <!-- Bitbake versions which correspond to the metadata release -->
    <object model="orm.bitbakeversion" pk="1">
       <field type="CharField" name="name">&DISTRO_NAME_NO_CAP;</field>
-      <field type="CharField" name="giturl">git://git.yoctoproject.org/poky</field>
+      <field type="CharField" name="giturl">git://git.openembedded.org/bitbake</field>
       <field type="CharField" name="branch">&DISTRO_NAME_NO_CAP;</field>
       <field type="CharField" name="dirpath">bitbake</field>
    </object>
@@ -513,8 +512,7 @@ at the
 `Django <https://docs.djangoproject.com/en/2.2/topics/settings/>`__
 site. However, several ``manage.py`` commands have been created that are
 specific to Toaster and are used to control configuration and back-end
-tasks. You can locate these commands in the
-:term:`Source Directory` (e.g. ``poky``) at
+tasks. You can locate these commands in :term:`BitBake` at
 ``bitbake/lib/manage.py``. This section documents those commands.
 
 .. note::
@@ -551,7 +549,7 @@ example that assumes default repository and :term:`Build Directory` names:
 
 .. code-block:: shell
 
-   $ cd poky/build
+   $ cd project/build
    $ python ../bitbake/lib/toaster/manage.py buildslist
 
 If your Toaster database had only one build, the above
diff --git a/documentation/toaster-manual/setup-and-use.rst b/documentation/toaster-manual/setup-and-use.rst
index a0c27499ba..6ca5d252a3 100644
--- a/documentation/toaster-manual/setup-and-use.rst
+++ b/documentation/toaster-manual/setup-and-use.rst
@@ -15,15 +15,15 @@ Toaster`" chapter, you are ready to start
 Toaster.
 
 Navigate to the root of your
-:term:`Source Directory` (e.g. ``poky``)::
+:term:`Source Directory` (e.g. ``project``)::
 
-   $ cd poky
+   $ cd project
 
 Once in that directory, source the build environment script::
 
-   $ source oe-init-build-env
+   $ source layers/openembedded-core/oe-init-build-env
 
-Next, from the :term:`Build Directory` (e.g. ``poky/build``), start Toaster
+Next, from the :term:`Build Directory` (e.g. ``project/build``), start Toaster
 using this command::
 
    $ source toaster start
@@ -112,8 +112,8 @@ This example binds to a specific IP address on the host's NIC::
 The Directory for Cloning Layers
 ================================
 
-Toaster creates a ``_toaster_clones`` directory inside your Source
-Directory (i.e. ``poky``) to clone any layers needed for your builds.
+Toaster creates a ``_toaster_clones`` directory inside your :term:`Source
+Directory` to clone any layers needed for your builds.
 
 Alternatively, if you would like all of your Toaster related files and
 directories to be in a particular location other than the default, you
@@ -124,8 +124,8 @@ causes Toaster to create and use ``$TOASTER_DIR./_toaster_clones``.
 The Build Directory
 ===================
 
-Toaster creates a :term:`Build Directory` within your Source Directory (e.g.
-``poky``) to execute the builds.
+Toaster creates a :term:`Build Directory` within your :term:`Source Directory`
+to execute the builds.
 
 Alternatively, if you would like all of your Toaster related files and
 directories to be in a particular location, you can set the
@@ -155,8 +155,8 @@ superuser by following these steps:
    is the :term:`Build Directory`, invoke the ``createsuperuser`` command from
    ``manage.py``::
 
-      $ cd poky/build
-      $ ../bitbake/lib/toaster/manage.py createsuperuser
+      $ cd project/build
+      $ ../layers/bitbake/lib/toaster/manage.py createsuperuser
 
 #. Django prompts you for the username, which you need to provide.
 
@@ -233,17 +233,21 @@ Perform the following steps to install Toaster:
       $ sudo /usr/sbin/useradd toaster -md /var/www/toaster -s /bin/false
       $ sudo su - toaster -s /bin/bash
 
-#.  Checkout a copy of ``poky`` into the web server directory. You will
+#.  Checkout a copy of :term:`BitBake` into the web server directory. You will
     be using ``/var/www/toaster``::
 
-      $ git clone git://git.yoctoproject.org/poky
-      $ git checkout &DISTRO_NAME_NO_CAP;
+      $ git clone git://git.openembedded.org/bitbake
+
+#.  Checkout a version of :term:`BitBake` matching the current Yocto Project
+    &DISTRO_NAME; release::
+
+      $ git checkout &BITBAKE_SERIES;
 
 #.  Install Toaster dependencies using the ``--user`` flag which keeps the
     Python packages isolated from your system-provided packages::
 
       $ cd /var/www/toaster/
-      $ pip3 install --user -r ./poky/bitbake/toaster-requirements.txt
+      $ pip3 install --user -r ./bitbake/toaster-requirements.txt
       $ pip3 install --user mysqlclient
 
     .. note::
@@ -253,7 +257,7 @@ Perform the following steps to install Toaster:
        manager to install the packages.
 
 #.  Configure Toaster by editing
-    ``/var/www/toaster/poky/bitbake/lib/toaster/toastermain/settings.py``
+    ``/var/www/toaster/bitbake/lib/toaster/toastermain/settings.py``
     as follows:
 
     -  Edit the
@@ -298,9 +302,9 @@ Perform the following steps to install Toaster:
 #.  Get Toaster to create the database schema, default data, and gather
     the statically-served files::
 
-      $ cd /var/www/toaster/poky/
+      $ cd /var/www/toaster/
       $ ./bitbake/lib/toaster/manage.py migrate
-      $ TOASTER_DIR=`pwd\` TEMPLATECONF='poky' \
+      $ TOASTER_DIR=`pwd` TEMPLATECONF='poky' \
          ./bitbake/lib/toaster/manage.py checksettings
       $ ./bitbake/lib/toaster/manage.py collectstatic
 
@@ -322,12 +326,12 @@ Perform the following steps to install Toaster:
     directory is created on the file system. In the example above,
     ``TOASTER_DIR`` is set as follows::
 
-       /var/www/toaster/poky
+       /var/www/toaster/
 
 
     This setting causes the Toaster :term:`Build Directory` to be::
 
-       /var/www/toaster/poky/build
+       /var/www/toaster/build
 
     Finally, the ``collectstatic`` command is a Django framework command
     that collects all the statically served files into a designated
@@ -380,14 +384,14 @@ Perform the following steps to install Toaster:
          </IfModule>
       </Directory>
 
-      <Directory /var/www/toaster/poky/bitbake/lib/toaster/toastermain>
+      <Directory /var/www/toaster/bitbake/lib/toaster/toastermain>
          <Files "wsgi.py">
             Require all granted
          </Files>
       </Directory>
 
-      WSGIDaemonProcess toaster_wsgi python-path=/var/www/toaster/poky/bitbake/lib/toaster:/var/www/toaster/.local/lib/python3.4/site-packages
-      WSGIScriptAlias / "/var/www/toaster/poky/bitbake/lib/toaster/toastermain/wsgi.py"
+      WSGIDaemonProcess toaster_wsgi python-path=/var/www/toaster/bitbake/lib/toaster:/var/www/toaster/.local/lib/python3.4/site-packages
+      WSGIScriptAlias / "/var/www/toaster/bitbake/lib/toaster/toastermain/wsgi.py"
       <Location />
          WSGIProcessGroup toaster_wsgi
       </Location>
@@ -419,16 +423,16 @@ Perform the following steps to install Toaster:
 
       [Service]
       Type=forking User=toaster
-      ExecStart=/usr/bin/screen -d -m -S runbuilds /var/www/toaster/poky/bitbake/lib/toaster/runbuilds-service.sh start
+      ExecStart=/usr/bin/screen -d -m -S runbuilds /var/www/toaster/bitbake/lib/toaster/runbuilds-service.sh start
       ExecStop=/usr/bin/screen -S runbuilds -X quit
-      WorkingDirectory=/var/www/toaster/poky
+      WorkingDirectory=/var/www/toaster
 
       [Install]
       WantedBy=multi-user.target
 
 
     Prepare the ``runbuilds-service.sh`` script that you need to place in the
-    ``/var/www/toaster/poky/bitbake/lib/toaster/`` directory by setting
+    ``/var/www/toaster/bitbake/lib/toaster/`` directory by setting
     up executable permissions::
 
       #!/bin/bash
@@ -436,7 +440,7 @@ Perform the following steps to install Toaster:
       #export http_proxy=http://proxy.host.com:8080
       #export https_proxy=http://proxy.host.com:8080
       #export GIT_PROXY_COMMAND=$HOME/bin/gitproxy
-      cd poky/
+      cd /var/www/toaster/
       source ./oe-init-build-env build
       source ../bitbake/bin/toaster $1 noweb
       [ "$1" == 'start' ] && /bin/bash
diff --git a/documentation/toaster-manual/start.rst b/documentation/toaster-manual/start.rst
index 2d6474852a..ed7b0e1644 100644
--- a/documentation/toaster-manual/start.rst
+++ b/documentation/toaster-manual/start.rst
@@ -25,10 +25,8 @@ Establishing Toaster System Dependencies
 
 Toaster requires extra Python dependencies in order to run. A Toaster
 requirements file named ``toaster-requirements.txt`` defines the Python
-dependencies. The requirements file is located in the ``bitbake``
-directory, which is located in the root directory of the
-:term:`Source Directory` (e.g.
-``poky/bitbake/toaster-requirements.txt``). The dependencies appear in a
+dependencies. The requirements file is located in the :term:`BitBake`
+repository, (``bitbake/toaster-requirements.txt``). The dependencies appear in a
 ``pip``, install-compatible format.
 
 Install Toaster Packages

-- 
2.51.0


