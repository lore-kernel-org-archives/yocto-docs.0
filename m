Return-Path: <daiane.angolini@foundries.io>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E68FBD2FEF4
	for <webhook@archiver.kernel.org>; Tue, 27 Jan 2026 21:53:20 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1234.1769550799766424007
 for <docs@lists.yoctoproject.org>;
 Tue, 27 Jan 2026 13:53:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@foundries.io header.s=google header.b=SrhYXLzg;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: foundries.io, ip: 205.220.168.131, mailfrom: daiane.angolini@foundries.io)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60RHhitm1953421
	for <docs@lists.yoctoproject.org>; Tue, 27 Jan 2026 21:53:19 GMT
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4by2118rbj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <docs@lists.yoctoproject.org>; Tue, 27 Jan 2026 21:53:19 +0000 (GMT)
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-1233b91de6bso10551775c88.1
        for <docs@lists.yoctoproject.org>; Tue, 27 Jan 2026 13:53:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=foundries.io; s=google; t=1769550798; x=1770155598; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ESse4nNoHkFl7Nd8RaCGODmg93SudfdI2uaP9m81xxE=;
        b=SrhYXLzgRPjc1dOOkAGuvdQ/VF9ZAiI8QVP50lZcgE62r4CmxATMKfFe0AxI6JZNLF
         vn23DZNHWyn2Qefd3bw+PmaXSdXUW0/h9g4zCvqXB3oXg4D5cyBn9ofEqERSbENCK9q+
         xBewHOi6rj8+5oaE6fAVqXTcDZ1WEAb/RkfXMPLHo5Jgp4YGWIU3VD4HRg6sG/l/S7wQ
         4JwDw/7bwm8QK5UEEhd1sDLkH347gxXVns6n1hMjtPCvNz3sfESARUoKO3rCOMBP84T6
         r7qnI3bCNMIex8wGI/sPnhz1x3KOMOTlCjL51Mo4iUoUK4/PZU7RhIe12BsjxCGzkn6d
         I1Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769550798; x=1770155598;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ESse4nNoHkFl7Nd8RaCGODmg93SudfdI2uaP9m81xxE=;
        b=As1maIZYZFEZR4meu4autjbaY3uUt5/lX2hnLDUoNevbWVP7s6FNBBxyyzOJoC0TWz
         JHOKuBWXV5jwIhO2dCzWG5MNmUhD0ZPDGx2D3ECl36AUDWpa7jem1avWfZKydisc/+U9
         o6LCIY5+C8FclclRgqx8gnaiZl1/iPRp+rHsA4Av7+IIJkID9+OkzvvcXoJ+agHV/Q4+
         x+Ooyiei1QBZlxbwmYjKHKUJdVnA0vy9WBLnnQouXKgs1emVj7AE5r8pVTRsGw1nSZqB
         NVOkOlxQqxfaUvAb+Kd8xvTIfiTMIt1M2MVpUp/XhtYSaairyGh0q+lIXhDTY8BRGubM
         xgQA==
X-Gm-Message-State: AOJu0Yy1jGB6ClH234MKNrlsvMc/Bw/a/70n9jtW7KydQ4q8rLNwsis1
	ZwiiSFsxzCpxTUZ4NfOKvUikP7bu/hXHwN48hkCFIJtX81Z8A8CVsOIU21EFgiNR7fmqZilbKPT
	Nm6zLr9dy3FaIzD++gnWfgX0zc8Z4k+kTFJoSHq9eGjvXkx8+xFMvPyjz/5bQQ3JO
X-Gm-Gg: AZuq6aJYxJA+jZjpjdIS0GsZKXHC+Uzx3oqc5+hNq7GAD3Wn8SHQucyd62q+AproLfB
	Byk3TXl723LN3TTLA30LSl/Js1BS0S+GwYIWDuzyM546lptLQm4o7llhIfbOxNwlXEoLvSSrg26
	COBFINQy9Roz+3hk0IFlNFR2Rq44k/eoeAHjKsUK+Z133Y11da57IZyXjStK7JaLrkBT9DrvQVV
	InLptfT0M1pB5WYoHU5Dihl+s4AJFYnADI1d5qyzXy7W3uWRgnDeQ4Ipgf6WmExtNrI+bkEzB13
	ZZxU521a/9EbdV0zBjwkx9gBnDWdgR3PoAnItLQ+G0RGoRRqKnENVrrDFrPoHKLiXvapdVTiyQt
	w5hj074mX6xSbGyjz6g2uf2kqBfiyzUBUtqsHqc8biluYethtWGQs7xz+bBAVpgr4nDPDxB4l3v
	h7Iw==
X-Received: by 2002:a05:7022:fa3:b0:123:35cb:96e3 with SMTP id a92af1059eb24-124a00e4d53mr1984605c88.46.1769550798183;
        Tue, 27 Jan 2026 13:53:18 -0800 (PST)
X-Received: by 2002:a05:7022:fa3:b0:123:35cb:96e3 with SMTP id a92af1059eb24-124a00e4d53mr1984581c88.46.1769550797492;
        Tue, 27 Jan 2026 13:53:17 -0800 (PST)
Received: from lola.lan ([187.183.40.109])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-124a9cdcbcfsm31627c88.0.2026.01.27.13.53.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Jan 2026 13:53:17 -0800 (PST)
From: Daiane Angolini <daiane.angolini@foundries.io>
To: bitbake-devel@lists.openembedded.org
Cc: docs@lists.yoctoproject.org,
        Daiane Angolini <daiane.angolini@foundries.io>
Subject: [docs][PATCH v2 1/4] doc: change some terminology around bitbake-setup
Date: Tue, 27 Jan 2026 18:53:00 -0300
Message-Id: <20260127215303.512936-2-daiane.angolini@foundries.io>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260127215303.512936-1-daiane.angolini@foundries.io>
References: <20260127215303.512936-1-daiane.angolini@foundries.io>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI3MDE3OCBTYWx0ZWRfXyuzcFJ6op1ai
 ZoJthua/cF0nmJx5hnNWIj/hSKi5evLI1zOdxZIlntOI0Me7vAKMMknFJDZZYlsaRb2WCUx4Vkn
 o50cDZ6/07FnrBegE6Fo9pcj77ilCbZu8sGXsL0+vWfqYSM9uDHgUu1V827rS6vxaiZH/dZ0xdn
 U6JUYBmHzbWt3jQc+rvq12pa3N9LJLDGb8dnMuyq5blnbN/Hb1RmbDDWkFXQN4BBlidgIJGwuwd
 uvWx5KuOse76FdQg9qYJbg5MY4PdTOoR1qjp06s+8rqJYiUT3t6/bPZlIqKaqnSeo46FGYiwbcR
 KJv/QzfpoSjQWXuQhWb6iqIkxIM46yuP8KqO8ii6N1EGFIIZfwxiF1ctVwJdH2+bcbGqa8v4qqo
 H8L4KSa6v7t4Rd+AnjqrM/JUMTzVAqw2oNQdIjaNvcYkyG+o43NRZiU4wt5hlAiPKfOD/moZMdO
 fZkKzeYtpoJko9tNyGQ==
X-Authority-Analysis: v=2.4 cv=GuxPO01C c=1 sm=1 tr=0 ts=697933cf cx=c_pps
 a=SvEPeNj+VMjHSW//kvnxuw==:117 a=PIITv4rVe324bgT4salBLw==:17
 a=vUbySO9Y5rIA:10 a=9UA2AVYIz8kA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Q4-j1AaZAAAA:8 a=A1X0JdhQAAAA:8 a=YEfPZHoM8sb2t3cV5ooA:9
 a=Kq8ClHjjuc5pcCNDwlU0:22 a=9H3Qd4_ONW2Ztcrla5EB:22
X-Proofpoint-GUID: YBjQOAikljw1Ar9qqhhSo-s5fVmalPD4
X-Proofpoint-ORIG-GUID: YBjQOAikljw1Ar9qqhhSo-s5fVmalPD4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-27_04,2026-01-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 malwarescore=0 lowpriorityscore=0 phishscore=0
 bulkscore=0 impostorscore=0 spamscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601270178
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 27 Jan 2026 21:53:20 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8751

Change some terms to use more specific wording:

  Generic Configuration  -> Configuration Template
  Specific Configuration -> Configuration Instance

Signed-off-by: Daiane Angolini <daiane.angolini@foundries.io>
---
 .../bitbake-user-manual-environment-setup.rst | 86 +++++++++----------
 1 file changed, 43 insertions(+), 43 deletions(-)

diff --git a/doc/bitbake-user-manual/bitbake-user-manual-environment-setup.rst b/doc/bitbake-user-manual/bitbake-user-manual-environment-setup.rst
index 3b6a73fd8..76f5c41e3 100644
--- a/doc/bitbake-user-manual/bitbake-user-manual-environment-setup.rst
+++ b/doc/bitbake-user-manual/bitbake-user-manual-environment-setup.rst
@@ -41,8 +41,8 @@ Quick Start
       $ ./bitbake/bin/bitbake-setup init
 
    This command will ask you to choose which configurations to use available as
-   part of the default BitBake :term:`generic configurations <generic
-   Configuration>`.
+   part of the default BitBake :term:`Configuration Templates <Configuration
+   Template>`.
 
    .. note::
 
@@ -73,8 +73,8 @@ Quick Start
 
       The name of the directory will vary depending on the choices.
 
-   -  ``config/``: holds the :term:`Specific Configuration`, which embeds the
-      :term:`Generic Configuration` (first choice of the :ref:`ref-bbsetup-command-init` command)
+   -  ``config/``: holds the :term:`Configuration Instance`, which embeds the
+      :term:`Configuration Template` (first choice of the :ref:`ref-bbsetup-command-init` command)
       and the choices made during the initialization.
 
    -  ``build/``: the :term:`BitBake Build` directory, where BitBake stores
@@ -145,12 +145,12 @@ The "Top Directory" and "Setup" directories are defined as follows:
    :term:`Setup`
       A Setup is the result of the :ref:`ref-bbsetup-command-init`
       command, which creates a :term:`Setup` directory. It is constructed from a
-      :term:`Generic Configuration` and choices made during the ``init`` command.
+      :term:`Configuration Template` and choices made during the ``init`` command.
 
       It contains at least:
 
       -  A :term:`BitBake Build` (``build/`` directory).
-      -  A :term:`Specific Configuration` (``config/`` directory).
+      -  A :term:`Configuration Instance` (``config/`` directory).
       -  Sources such as :ref:`layers
          <bitbake-user-manual/bitbake-user-manual-intro:Layers>` or other
          repositories managed by ``bitbake-setup`` (``layers/`` directory).
@@ -173,8 +173,8 @@ The following components are involved to create the content of these directories
       Build` constitute the :ref:`BitBake configuration
       <bitbake-user-manual/bitbake-user-manual-intro:Configuration Files>`.
 
-   :term:`Generic Configuration`
-      A Generic Configuration is a file in JSON format containing a template to
+   :term:`Configuration Template`
+      A Configuration Template is a file in JSON format containing a template to
       create a :term:`Setup`. These files are used during the :ref:`ref-bbsetup-command-init`
       command as a starting point to configure the :term:`Setup`. When the
       command runs, the user may be prompted with choices to further specify the
@@ -183,42 +183,42 @@ The following components are involved to create the content of these directories
       It is also possible to specify the choices on the command line for a
       completely non-interactive initialization.
 
-      :term:`Generic Configuration` files are stored in :term:`registries
+      :term:`Configuration Template` files are stored in :term:`registries
       <Registry>`, and can be listed with the :ref:`ref-bbsetup-command-list`
       command.
 
-      :term:`Generic Configuration` files must end with the ``.conf.json``
+      :term:`Configuration Template` files must end with the ``.conf.json``
       suffix for ``bitbake-setup`` to locate them.
 
       .. note::
 
-         The default :term:`Generic Configurations <Generic Configuration>` are
+         The default :term:`Configuration Templates <Configuration Template>` are
          located in the BitBake repository in a local registry. the
          ``default-registry/`` directory. This can be modified with the
          :ref:`ref-bbsetup-setting-registry` setting.
 
       :ref:`ref-bbsetup-command-status` will tell if a :term:`Setup`
-      is in sync with the :term:`Generic Configuration` it was constructed from
+      is in sync with the :term:`Configuration Template` it was constructed from
       (typically: layer updates).
 
       :ref:`ref-bbsetup-command-update` will bring a :term:`Setup`
-      in sync with its :term:`Generic Configuration`.
+      in sync with its :term:`Configuration Template`.
 
-   :term:`Specific Configuration`
-      The :term:`Specific Configuration` is stored in the ``config/`` directory
-      in a :term:`Setup`. It embeds the :term:`Generic Configuration` and the
+   :term:`Configuration Instance`
+      The :term:`Configuration Instance` is stored in the ``config/`` directory
+      in a :term:`Setup`. It embeds the :term:`Configuration Template` and the
       choices made during the initialization.
 
-      It is also a Git repository, that contains a history of the specific
-      configuration and updates made to it via :ref:`ref-bbsetup-command-update`.
+      It is also a Git repository, that contains a history of the configuration
+      instance and updates made to it via :ref:`ref-bbsetup-command-update`.
 
    :term:`Registry`
-      A configuration registry is a place where one or more :term:`Generic
-      Configurations <Generic Configuration>` are stored.
+      A configuration registry is a place where one or more :term:`Configuration
+      Templates <Configuration Template>` are stored.
 
       The directory structure of the registry can be any: ``bitbake-setup``
       recursively find files ending with ``.conf.json`` and consider it a
-      :term:`Generic Configuration`.
+      :term:`Configuration Template`.
 
       The registry location is configured through the
       :ref:`ref-bbsetup-setting-registry` setting. This location can be the URL to
@@ -279,7 +279,7 @@ The ``bitbake-setup init`` sub-command helps initializing a :term:`Setup`.
 
 This command can be run without any arguments to prompt the user with
 configuration options to choose from. These configuration options are taken from
-the input :term:`Generic Configuration` files in the :term:`registry`.
+the input :term:`Configuration Template` files in the :term:`registry`.
 
 .. note::
 
@@ -288,9 +288,9 @@ the input :term:`Generic Configuration` files in the :term:`registry`.
 
 Otherwise, the first argument to :ref:`ref-bbsetup-command-init` can be:
 
--  A generic configuration ID in the registry.
--  A path to a generic configuration file on a local disk.
--  An HTTP URI to the generic configuration file.
+-  A Configuration Template ID in the registry.
+-  A path to a Configuration Template file on a local disk.
+-  An HTTP URI to the Configuration Template file.
 
 The choices made during the bare ``bitbake-setup init`` command can also be
 passed directly on the command-line, for example::
@@ -331,7 +331,7 @@ In addition, the command can take the following arguments:
 ``bitbake-setup init`` Examples
 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 
--  This example prompts the user to choose a :term:`Generic Configuration` from
+-  This example prompts the user to choose a :term:`Configuration Template` from
    a custom registry:
 
    .. code-block:: shell
@@ -340,18 +340,18 @@ In addition, the command can take the following arguments:
           --setting default registry 'git://example.com/bitbake-setup-configurations.git;protocol=https;branch=main;rev=main' \
           init
 
--  This example takes a :term:`Generic Configuration` from a remote location
+-  This example takes a :term:`Configuration Template` from a remote location
    (here, one of the default configuration in BitBake):
 
    .. code-block:: shell
 
       $ ./bitbake/bin/bitbake-setup init https://git.openembedded.org/bitbake/plain/default-registry/configurations/oe-nodistro-master.conf.json
 
--  This example initializes a :term:`Setup` with: 
+-  This example initializes a :term:`Setup` with:
 
    -  A custom :ref:`ref-bbsetup-setting-top-dir-prefix` and :ref:`ref-bbsetup-setting-top-dir-name`
    -  A :term:`source override`, and additionally overriding openembedded-core with a locally managed directory.
-   -  A standalone :term:`generic configuration` file.
+   -  A standalone :term:`Configuration Template` file.
    -  Choices passed on the command-line, applied non-interactively.
 
    .. code-block:: shell
@@ -371,8 +371,8 @@ In addition, the command can take the following arguments:
 ``bitbake-setup list``
 ----------------------
 
-The ``bitbake-setup list`` sub-command lists the available :term:`generic
-configurations <generic configuration>` in the current :term:`registry`.
+The ``bitbake-setup list`` sub-command lists the available :term:`Configuration
+Templates <Configuration Template>` in the current :term:`registry`.
 
 In addition, the command can take the following arguments:
 
@@ -388,8 +388,8 @@ In addition, the command can take the following arguments:
 ------------------------
 
 The ``bitbake-setup status`` sub-command shows the status of a
-:term:`Setup`. Any differences between the local copy of the :term:`generic
-configuration` and the upstream one are printed on the console.
+:term:`Setup`. Any differences between the local copy of the :term:`Configuration
+Template` and the upstream one are printed on the console.
 
 If the BitBake environment is sourced and ready to build, the ``bitbake-setup
 status`` command (without any arguments) will show the status of the current
@@ -407,7 +407,7 @@ In addition, the command can take the following arguments:
 ------------------------
 
 The ``bitbake-setup update`` sub-command updates a :term:`Setup` to sync with
-the latest changes from a :term:`generic configuration` it was constructed from.
+the latest changes from the :term:`Configuration Template` it was constructed from.
 The :ref:`ref-bbsetup-command-status` command can be used to show the current
 status of the :term:`Setup` before updating it.
 
@@ -617,16 +617,16 @@ manner.
 
 The :ref:`ref-bbsetup-setting-use-full-setup-dir-name` setting, if set to ``yes``
 will override the suggestions for the :term:`Setup` directory name made by
-``setup-dir-name`` entries in :term:`Generic Configuration` files. This
+``setup-dir-name`` entries in :term:`Configuration Template` files. This
 will make the directory names longer, but fully specific: they will contain
 all selections made during initialization.
 
 .. _ref-bbsetup-section-config-reference:
 
-Generic Configuration Files Reference
-=====================================
+Configuration Template Files Reference
+======================================
 
-:term:`Generic Configurations <Generic Configuration>` are the input files given
+:term:`Configuration Templates <Configuration Template>` are the input files given
 to ``bitbake-setup`` to configure :term:`Setups <Setup>`.
 
 These files are written in the JSON file format and are stored in a
@@ -891,8 +891,8 @@ They contain the following sections:
 
       would expand to ``somebuild-machine_gadget``.
 
-Generic Configuration Examples
-------------------------------
+Configuration Template Examples
+-------------------------------
 
 OpenEmbedded "nodistro" configuration for master branches:
 
@@ -945,10 +945,10 @@ Here is an example file that overrides the branch of the BitBake repository to
    }
 
 -  The ``version`` parameter contains the version of the used configuration, and
-   should match the one of the :term:`Generic Configuration` file in use.
+   should match the one of the :term:`Configuration Template` file in use.
 
 -  The ``sources`` section contains the same options as the ``sources`` option
-   of a :term:`Generic Configuration` file. See the
+   of a :term:`Configuration Template` file. See the
    :ref:`ref-bbsetup-section-config-reference` section for more information.
 
 .. _ref-bbsetup-fixed-revisions:
@@ -956,7 +956,7 @@ Here is an example file that overrides the branch of the BitBake repository to
 Fixed source revisions
 ======================
 
-:term:`Generic Configuration` can set source revisions in ``rev`` to a tag or a branch.
+:term:`Configuration Template` can set source revisions in ``rev`` to a tag or a branch.
 Bitbake-setup will make sure the actual revision will match the tag or branch when performing
 initializations or updates, and will capture the revisions in a :ref:`ref-bbsetup-source-overrides`
 file.
-- 
2.34.1


