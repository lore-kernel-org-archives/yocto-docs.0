Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8B5EECAAD8
	for <webhook@archiver.kernel.org>; Tue, 13 Sep 2022 17:38:35 +0000 (UTC)
Received: from smtp1.axis.com (smtp1.axis.com [195.60.68.17])
 by mx.groups.io with SMTP id smtpd.web09.508.1663090710830228564
 for <docs@lists.yoctoproject.org>;
 Tue, 13 Sep 2022 10:38:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=axis-central1 header.b=WFP6JLab;
 spf=pass (domain: axis.com, ip: 195.60.68.17,
 mailfrom: peter.kjellerstedt@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1663090711;
  x=1694626711;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=2slZA7Cika0lY9H2eIVHSoHOSh/l5LBG1EEUX0qMxFE=;
  b=WFP6JLabsdjFUyIXm/lf9rVqfglTbQKs3oZIyMyC8fnmn3o4NkfYGuv2
   QxIfD/ThEV8eUGQ/5KDBncLV7FRUUfunaoWAHq97m3k89w8l+2jel47WE
   wI/capLzAAhCwEYEmekIfvi2jrGADmAB393FiEVPHc47t9An+QwM0ZwFk
   XkhB027k0ltkjmmbZhq5t8gxr92ViaxbcvirSC6sb8chK+7gKNCWna20D
   zXCuBDRqWVBb/XlLAXtea+5d4m/edePj4bY2Hn2KxuPrBiGCQVyxEmSFL
   AhcMAm2dXtagnAhHJf5z1NRDWldHJdDMxTYWTfj/y+wZtHJbuXWu8pE0n
   Q==;
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>, "docs@lists.yoctoproject.org"
	<docs@lists.yoctoproject.org>
CC: Alexander Kanavin <alex@linutronix.de>
Subject: RE: [docs] [PATCH 5/5] common-tasks.rst: rewrite the section about
 configuration templates
Thread-Topic: [docs] [PATCH 5/5] common-tasks.rst: rewrite the section about
 configuration templates
Thread-Index: AQHYxgOmrtezQaE860WfhY1BSZiD963doZfA
Date: Tue, 13 Sep 2022 17:38:27 +0000
Message-ID: <f20e7ca0158e49329b2ed2d7685ef945@axis.com>
References: <20220911172608.2542076-1-alex@linutronix.de>
 <20220911172608.2542076-5-alex@linutronix.de>
In-Reply-To: <20220911172608.2542076-5-alex@linutronix.de>
Accept-Language: en-US, sv-SE
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.0.5.60]
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 13 Sep 2022 17:38:35 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3160

> -----Original Message-----
> From: docs@lists.yoctoproject.org <docs@lists.yoctoproject.org> On Behalf
> Of Alexander Kanavin
> Sent: den 11 september 2022 18:26
> To: docs@lists.yoctoproject.org
> Cc: Alexander Kanavin <alex@linutronix.de>
> Subject: [docs] [PATCH 5/5] common-tasks.rst: rewrite the section about
> configuration templates
>=20
> This now includes a description about how to create a template
> with the newly added tooling, and drops the description
> of .templateconf as a way to point to a custom template
> (which is not correct: .templateconf is used only to point to a default
> template in poky or core when TEMPLATECONF is not specified).

I do not agree with this sentiment. If you create and distribute a setup=20
similar to Poky (which we do), why would we not change .templateconf to=20
point at our templates? This has been the documented method and the one=20
at least we use for our distribution. Where have you gotten the notion=20
that this is only to be used by OE-Core & Poky? It does not make sense.

//Peter

>=20
> Signed-off-by: Alexander Kanavin <alex@linutronix.de>
> ---
>  documentation/dev-manual/common-tasks.rst | 92 +++++++++--------------
>  1 file changed, 36 insertions(+), 56 deletions(-)
>=20
> diff --git a/documentation/dev-manual/common-tasks.rst
> b/documentation/dev-manual/common-tasks.rst
> index 6c2df9aa6..eab5648fd 100644
> --- a/documentation/dev-manual/common-tasks.rst
> +++ b/documentation/dev-manual/common-tasks.rst
> @@ -6463,71 +6463,51 @@ Creating a Custom Template Configuration Director=
y
>  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D
>=20
>  If you are producing your own customized version of the build system for
> -use by other users, you might want to customize the message shown by the
> -setup script or you might want to change the template configuration
> -files (i.e. ``local.conf`` and ``bblayers.conf``) that are created in a
> -new build directory.
> +use by other users, you might want to provide a custom build
> configuration
> +that includes all the necessary settings and layers (i.e. ``local.conf``
> and
> +``bblayers.conf`` that are created in a new build directory) and a custo=
m
> +message that is shown when setting up the build. This can be done by
> +creating one or more template configuration directories in your
> +custom distribution layer.
>=20
> -The OpenEmbedded build system uses the environment variable
> -:term:`TEMPLATECONF` to locate the directory from which it gathers
> -configuration information that ultimately ends up in the
> -:term:`Build Directory` ``conf`` directory.
> -By default, :term:`TEMPLATECONF` is set as follows in the ``poky``
> -repository::
> +This can be done by using ``bitbake-layers save-build-conf``:
>=20
> -   TEMPLATECONF=3D${TEMPLATECONF:-meta-poky/conf}
> -
> -This is the
> -directory used by the build system to find templates from which to build
> -some key configuration files. If you look at this directory, you will
> -see the ``bblayers.conf.sample``, ``local.conf.sample``, and
> -``conf-notes.txt`` files. The build system uses these files to form the
> -respective ``bblayers.conf`` file, ``local.conf`` file, and display the
> -list of BitBake targets when running the setup script.
> -
> -To override these default configuration files with configurations you
> -want used within every new Build Directory, simply set the
> -:term:`TEMPLATECONF` variable to your directory. The :term:`TEMPLATECONF=
`
> -variable is set in the ``.templateconf`` file, which is in the top-level
> -:term:`Source Directory` folder
> -(e.g. ``poky``). Edit the ``.templateconf`` so that it can locate your
> -directory.
> +   $ bitbake-layers save-build-conf ../../meta-alex/ test-1
> +   NOTE: Starting bitbake server...
> +   NOTE: Configuration template placed into /srv/work/alex/meta-
> alex/conf/templates/test-1
> +   Please review the files in there, and particularly provide a
> configuration description in /srv/work/alex/meta-alex/conf/templates/test=
-
> 1/conf-notes.txt
> +   You can try out the configuration with
> +   TEMPLATECONF=3D/srv/work/alex/meta-alex/conf/templates/test-1 .
> /srv/work/alex/poky/oe-init-build-env build-try-test-1
>=20
> -Best practices dictate that you should keep your template configuration
> -directory in your custom distribution layer. For example, suppose you
> -have a layer named ``meta-mylayer`` located in your home directory and
> -you want your template configuration directory named ``myconf``.
> -Changing the ``.templateconf`` as follows causes the OpenEmbedded build
> -system to look in your directory and base its configuration files on the
> -``*.sample`` configuration files it finds. The final configuration files
> -(i.e. ``local.conf`` and ``bblayers.conf`` ultimately still end up in
> -your Build Directory, but they are based on your ``*.sample`` files.
> -::
> +The above command takes the config files from the currently active build
> directory under ``conf\``,
> +replaces site-specific paths in bblayers.conf with ##OECORE##-relative
> paths, and copies
> +the config files into a specified layer under a specified template name.
>=20
> -   TEMPLATECONF=3D${TEMPLATECONF:-meta-mylayer/myconf}
> +To use those saved templates as a starting point for a build, users
> should point
> +to one of them with :term:`TEMPLATECONF` environment variable:
>=20
> -Aside from the ``*.sample`` configuration files, the ``conf-notes.txt``
> -also resides in the default ``meta-poky/conf`` directory. The script
> -that sets up the build environment (i.e.
> -:ref:`structure-core-script`) uses this file to
> -display BitBake targets as part of the script output. Customizing this
> -``conf-notes.txt`` file is a good way to make sure your list of custom
> -targets appears as part of the script's output.
> +   TEMPLATECONF=3D/srv/work/alex/meta-alex/conf/templates/test-1 .
> /srv/work/alex/poky/oe-init-build-env build-try-test-1
>=20
> -Here is the default list of targets displayed as a result of running
> -either of the setup scripts::
> +The OpenEmbedded build system uses the environment variable
> +:term:`TEMPLATECONF` to locate the directory from which it gathers
> +configuration information that ultimately ends up in the
> +:term:`Build Directory` ``conf`` directory.
>=20
> -   You can now run 'bitbake <target>'
> +If :term:`TEMPLATECONF` is not set, the default value is obtained
> +from ```.templateconf`` file that is read from the same directory as
> +`oe-init-build-env` script. For ``poky`` reference distribution this
> +would be::
>=20
> -   Common targets are:
> -       core-image-minimal
> -       core-image-sato
> -       meta-toolchain
> -       meta-ide-support
> +   TEMPLATECONF=3D${TEMPLATECONF:-meta-poky/conf/templates/default}
>=20
> -Changing the listed common targets is as easy as editing your version of
> -``conf-notes.txt`` in your custom template configuration directory and
> -making sure you have :term:`TEMPLATECONF` set to your directory.
> +If you look at a configuration template directory, you will
> +see the ``bblayers.conf.sample``, ``local.conf.sample``, and
> +``conf-notes.txt`` files. The build system uses these files to form the
> +respective ``bblayers.conf`` file, ``local.conf`` file, and show
> +users a note about the build they're setting up
> +when running the ``oe-init-build-env`` setup script. These can be
> +edited further if needed to improve or change the build configurations
> +available to the users.
>=20
>  Conserving Disk Space
>  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> --
> 2.30.2


