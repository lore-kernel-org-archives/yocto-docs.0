Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7FF6CAC5B9
	for <webhook@archiver.kernel.org>; Fri, 26 Sep 2025 13:06:41 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.web11.16849.1758891996226550228
 for <docs@lists.yoctoproject.org>;
 Fri, 26 Sep 2025 06:06:36 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@bootlin.com header.s=dkim header.b=SN1If1EF;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 0B5E6C00D95
	for <docs@lists.yoctoproject.org>; Fri, 26 Sep 2025 13:06:17 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id AF01E606E3;
	Fri, 26 Sep 2025 13:06:30 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id C835D102F18DB;
	Fri, 26 Sep 2025 15:06:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1758891990; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=UIhdR9DUeBiEflixbGRH7wV8I2d3cnrWokuBwizDudE=;
	b=SN1If1EFRmlXqkAlUe4c90VbOK6bArBUULqjBY7By8QDp6qCXFXEzc4nwrKBZoIcoJt3FH
	eWckyzyIsGlU/KqHuMT0MM7cVt3EoQDn2ari8il7bI+p9t/HiR5bBVYe4Fa0bjICFTqPJG
	Rw8zoL1WjCTL8slLRVKKSbGXAjtBhs9IdTMTkvDsg95xYueBjTCY866f2Px+iv5eomznhy
	wWs5nCU0hRFS2MIQxQNC218yJCwaK5ySIDNg+2jR+lKm/EwJPmWTaVLmBGIwyVSAueAc8I
	ocIqkWHOcvA9lDmelkZe4mpMzjKud4V9wrLqWVsyHinDLAQXyy8KAVRXO3+hSw==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Fri, 26 Sep 2025 15:06:23 +0200
Subject: [PATCH v2 2/2] Add documentation on fragments
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20250926-fragments-v2-2-3f096c33efa0@bootlin.com>
References: <20250926-fragments-v2-0-3f096c33efa0@bootlin.com>
In-Reply-To: <20250926-fragments-v2-0-3f096c33efa0@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Tim Orling <tim.orling@konsulko.com>, 
 Alexander Kanavin <alex.kanavin@gmail.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=26849;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=yq9D4CcOPEOf9LOtte1U02/Y2r83NxsWHdNMNuUbsu0=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBo1o/SH07N/r01MakPv58wIkMhoed52nUUvoK1n
 kdwp9ABqQCJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCaNaP0gAKCRDRgEFAKaOo
 NmJGEACd54XOE//moFgooCPm0dhRphxmK22XNwOrKUx3j3taf1sx//yaamGHa+fQV9Ey4vvy+Jz
 siVA7djKy7PT363gqCx9vQUmDnZt0JG/LYMlXlvMFndowfyXNtotRKkTyieZmgZ9nzX5xxeLvq0
 x29DRMR8W476As3RL2n2TIiolp9e/YVVeSUpYNzKF2WRcfyClOowQDWZKwUKGzXY6Rn/KlwgTfl
 EkQpKQDtcufjgbbIVgvMurwoAXDBkwI8vnOL6UHuabcPIG+Gdmt0+AiekWfsVdvCFU+djn/hmVx
 I+kyoJZuXzVufVQ3sk4ohWOoo7a/R3q8L0qg/pLY1wPVvotgHpF64Jl0uDpaYil8Oi66ZSdvqBd
 BKnJo9RfGshYhvb8Ivl7TyLnPQ2Q4JEBBi0XLwJx8QWad+oi0/FFNE4TNryVrqbbb35ygTQiv+s
 XmNG3/TAQWgwALRodC0ZB8c+6QunEE6BgHXDvKR2M/ZRwgH38EekHI6ntjfxSZMldoF4DEHeUdW
 6j/WhiL45UisQS9/LJBzR40TLDSYemNO8ITuIKqYCJVrKXU2SFuMjkxvVbUpjyk6wQRhUf1m9N6
 z7ZmeXYjlR8e4k0lW4c2VZ34uFqOaam4SOeRylPyheajgxDf0QG6IrE14S4BEmMeZ70cbJ6QM7p
 W/jMVqn+yx4A7cQ==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 26 Sep 2025 13:06:41 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7617

- terms.rst: Provide the definitions of a Configuration Fragment and a
  Built-in Fragment.
- ref-manual: Add a quick reference guide on bitbake-config-build, and
  list the available fragments in OE-Core.
  Document the underlying variables related to fragments in the
  glossary.
- dev-manual: give instructions on how to create new custom fragments.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/dev-manual/creating-fragments.rst | 146 ++++++++++++++
 documentation/dev-manual/index.rst              |   1 +
 documentation/ref-manual/fragments.rst          | 258 ++++++++++++++++++=
++++++
 documentation/ref-manual/index.rst              |   1 +
 documentation/ref-manual/terms.rst              |  92 +++++++++
 documentation/ref-manual/variables.rst          |  39 ++++
 6 files changed, 537 insertions(+)

diff --git a/documentation/dev-manual/creating-fragments.rst b/documentat=
ion/dev-manual/creating-fragments.rst
new file mode 100644
index 000000000..7f437d7c9
--- /dev/null
+++ b/documentation/dev-manual/creating-fragments.rst
@@ -0,0 +1,146 @@
+.. SPDX-License-Identifier: CC-BY-SA-2.0-UK
+
+Creating New Configuration Fragments In Your Build
+**************************************************
+
+:term:`Configuration Fragments <Configuration Fragment>` define top leve=
l build
+configuration features that can be independently enabled and disabled us=
ing
+standard tooling. Such features are made of one or several build configu=
ration
+statements that are either contained in a fragment file, or are set indi=
rectly
+using the :term:`Built-in Fragment` mechanism.
+
+This section will describe how to create new fragments for your builds.
+
+There are two kinds of configuration fragments:
+
+-  Standard :term:`Configuration Fragments <Configuration Fragment>` whi=
ch a
+   stored in a file. These fragments include a summary and a description=
,
+   following by configuration statements.
+
+-  :term:`Built-in Fragments <Built-in Fragment>` which can be used to a=
ssign a
+   value to a single variable and do not require a separate definition f=
ile.
+   They are especially useful when a list of possible values is very lon=
g (or
+   infinite).
+
+Creating A Standard Configuration Fragment
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+
+By default, all configuration fragments are located within the
+``conf/fragments`` directory of a :term:`layer`. This location is define=
d by the
+:term:`OE_FRAGMENTS_PREFIX` variable which, in turn, is used as a parame=
ter in an
+:ref:`addfragments <bitbake-user-manual/bitbake-user-manual-metadata:\`\=
`addfragments\`\`
+directive>` directive in :oe_git:`bitbake.conf </openembedded-core/tree/=
meta/conf/bitbake.conf>`.
+
+You can create one or more :term:`configuration fragment` files in your
+:term:`layer` in this directory. Let's take the following example, where
+``custom-fragment.conf`` is our custom fragment file::
+
+   meta-custom
+   =E2=94=9C=E2=94=80=E2=94=80 conf
+   =E2=94=82=C2=A0=C2=A0 =E2=94=9C=E2=94=80=E2=94=80 fragments
+   =E2=94=82=C2=A0=C2=A0 =E2=94=82=C2=A0=C2=A0 =E2=94=94=E2=94=80=E2=94=80=
 custom-fragment.conf
+   =E2=94=82=C2=A0=C2=A0 =E2=94=94=E2=94=80=E2=94=80 layer.conf
+   ...
+
+For our ``custom-fragment.conf`` file, the following variables **must** =
be set
+for our fragment to be considered a valid fragment by the :term:`OpenEmb=
edded
+Build System`:
+
+-  :term:`BB_CONF_FRAGMENT_SUMMARY`: a one-line summary of this fragment=
.
+
+-  :term:`BB_CONF_FRAGMENT_DESCRIPTION`: a description of this fragment.
+
+.. note::
+
+   The :term:`BB_CONF_FRAGMENT_SUMMARY` and :term:`BB_CONF_FRAGMENT_DESC=
RIPTION`
+   variables are also passed as parameters in an :ref:`addfragments
+   <bitbake-user-manual/bitbake-user-manual-metadata:\`\`addfragments\`\=
`
+   directive>` directive in :oe_git:`bitbake.conf
+   </openembedded-core/tree/meta/conf/bitbake.conf>`.
+
+After creating these variables, our custom fragment should look like the
+following:
+
+.. code-block::
+   :caption: custom-fragment.conf
+
+   BB_CONF_FRAGMENT_SUMMARY =3D "This fragment sets a limit of 4 bitbake=
 threads and 4 parsing threads"
+   BB_CONF_FRAGMENT_DESCRIPTION =3D "This fragment is useful to constrai=
n resource consumption when the Yocto default \
+   is causing an overload of host machine's memory and CPU resources."
+
+For now, our fragment does not have any additional configuration stateme=
nt.
+Let's add the following assignments to our fragment:
+
+.. code-block::
+   :caption: custom-fragment.conf (continued)
+
+   BB_NUMBER_THREADS =3D "4"
+   BB_NUMBER_PARSE_THREADS =3D "4"
+
+This means that our fragment can be enabled to set a limit on the number=
 of
+threads :term:`BitBake` will use with the :term:`BB_NUMBER_THREADS` and
+:term:`BB_NUMBER_PARSE_THREADS` variables.
+
+For now, our fragment exists and is listed by the
+:ref:`ref-bitbake-config-build-list-fragments` command, but is not enabl=
ed. To
+enable this fragment, use the :ref:`ref-bitbake-config-build-enable-frag=
ment`
+command::
+
+   bitbake-config-build enable-fragment meta-custom/custom-fragment
+
+.. note::
+
+   The ``meta-custom`` prefix in the above command depends on the name o=
f your
+   layer. This name is defined by the :term:`BBFILE_COLLECTIONS` variabl=
e in
+   the ``conf/layer.conf`` file of your layer.
+
+Standard Configuration fragments can be organized in a more complex way.=
 For
+example, it's possible to create sub-directories to organize your fragme=
nts::
+
+   meta-custom
+   =E2=94=9C=E2=94=80=E2=94=80 conf
+   =E2=94=82=C2=A0=C2=A0 =E2=94=9C=E2=94=80=E2=94=80 fragments
+   =E2=94=82=C2=A0=C2=A0 =E2=94=82=C2=A0=C2=A0 =E2=94=9C=E2=94=80=E2=94=80=
 networking
+   =E2=94=82=C2=A0=C2=A0 =E2=94=82=C2=A0=C2=A0 =E2=94=82=C2=A0=C2=A0 =E2=
=94=94=E2=94=80=E2=94=80 mirrors.conf
+   =E2=94=82=C2=A0=C2=A0 =E2=94=82=C2=A0=C2=A0 =E2=94=94=E2=94=80=E2=94=80=
 resources
+   =E2=94=82=C2=A0=C2=A0 =E2=94=82=C2=A0=C2=A0     =E2=94=94=E2=94=80=E2=
=94=80 numberthreads.conf
+   =E2=94=82=C2=A0=C2=A0 =E2=94=94=E2=94=80=E2=94=80 layer.conf
+   ...
+
+In the above example, the ``meta-custom/networking/mirrors`` and
+``meta-custom/resources/numberthreads`` fragments will be available in y=
our
+build.
+
+Creating A Built-in Fragment
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D
+
+Within the :term:`OpenEmbedded Build System`, Built-in Fragments are def=
ined
+with the :term:`OE_FRAGMENTS_BUILTIN` variable, which is passed as a
+parameter in an :ref:`addfragments <bitbake-user-manual/bitbake-user-man=
ual-metadata:\`\`addfragments\`\`
+directive>` directive in :oe_git:`bitbake.conf </openembedded-core/tree/=
meta/conf/bitbake.conf>`.
+
+Adding new :term:`Built-in Fragments <Built-in Fragment>` can be done by
+appending the :term:`OE_FRAGMENTS_BUILTIN` variable from your :term:`lay=
er`
+configuration file:
+
+.. code-block::
+   :caption: layer.conf
+
+   OE_FRAGMENTS_BUILTIN:append =3D " custom-builtin-fragment:CUSTOM_VARI=
ABLE"
+
+.. warning::
+
+   Make sure to use the ``:append`` override in the above assignment, as=
 using
+   ``+=3D`` can lead to unexpected behavior.
+
+.. warning::
+
+   Due to the way :term:`BitBake` parses files, it is not possible to mo=
dify
+   :term:`OE_FRAGMENTS_BUILTIN` from any kind of :term:`configuration fi=
le`.
+   Setting it from the :term:`layer` configuration file (``conf/layer.co=
nf``) is
+   the retained solution to create new built-in fragments.
+
+You can then use the :ref:`ref-bitbake-config-build-enable-fragment` com=
mand to
+set a value to the ``CUSTOM_VARIABLE`` variable::
+
+   bitbake-config-build enable-fragment custom-builtin-fragment/somevalu=
e
diff --git a/documentation/dev-manual/index.rst b/documentation/dev-manua=
l/index.rst
index ea528855a..7a581236a 100644
--- a/documentation/dev-manual/index.rst
+++ b/documentation/dev-manual/index.rst
@@ -16,6 +16,7 @@ Yocto Project Development Tasks Manual
    new-machine
    upgrading-recipes
    temporary-source-code
+   creating-fragments
    quilt.rst
    development-shell
    python-development-shell
diff --git a/documentation/ref-manual/fragments.rst b/documentation/ref-m=
anual/fragments.rst
new file mode 100644
index 000000000..c0118876c
--- /dev/null
+++ b/documentation/ref-manual/fragments.rst
@@ -0,0 +1,258 @@
+.. SPDX-License-Identifier: CC-BY-SA-2.0-UK
+
+*****************************
+Using Configuration Fragments
+*****************************
+
+:term:`Configuration Fragments <Configuration Fragment>` define top leve=
l build
+configuration features that can be independently enabled and disabled us=
ing
+standard tooling. Such features are made of one or several build configu=
ration
+statements that are either contained in a fragment file, or are set indi=
rectly
+using the :term:`Built-in Fragment` mechanism.
+
+This document provides a quick reference of the :oe_git:`bitbake-config-=
build
+</bitbake/tree/bin/bitbake-config-build>` tool and lists the
+:term:`Configuration Fragments <Configuration Fragment>` and :term:`Buil=
t-in
+Fragments <Built-in Fragment>` available in the :term:`OpenEmbedded Buil=
d
+System` core repositories.
+
+.. note::
+
+   For details on how to define new fragments in your build, see the
+   :doc:`/dev-manual/creating-fragments` section of the Yocto Project De=
velopment
+   Tasks Manual.
+
+``bitbake-config-build`` Quick Reference
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+
+:term:`Configuration Fragments <Configuration Fragment>` are managed wit=
h the
+:oe_git:`bitbake-config-build </bitbake/tree/bin/bitbake-config-build>`
+command-line tool, which is available after :ref:`dev-manual/start:Initi=
alizing
+the Build Environment`.
+
+The ``bitbake-config-build`` command-line tool uses sub-commands to mana=
ge
+fragments, which are detailed in the sections below. For each sub-comman=
d, the
+``--help`` flag can be passed to get more information on the sub-command=
.
+
+.. _ref-bitbake-config-build-list-fragments:
+
+``bitbake-config-build list-fragments``
+---------------------------------------
+
+The :ref:`ref-bitbake-config-build-list-fragments` command will list the=
 :term:`Built-in
+Fragments <Built-in Fragment>` and :term:`Configuration Fragments <Confi=
guration
+Fragment>` that are currently available, and will also print which fragm=
ents are
+enabled or disabled.
+
+.. _ref-bitbake-config-build-show-fragment:
+
+``bitbake-config-build show-fragment``
+--------------------------------------
+
+The :ref:`ref-bitbake-config-build-show-fragment` command is used to sho=
w the
+location and value of a fragment. For example, running ``bitbake-config-=
build
+show-fragment core/yocto/sstate-mirror-cdn`` will show the content of th=
e
+:ref:`ref-fragments-core-yocto-sstate-mirror-cdn` fragment.
+
+.. _ref-bitbake-config-build-enable-fragment:
+
+``bitbake-config-build enable-fragment``
+----------------------------------------
+
+The :ref:`ref-bitbake-config-build-enable-fragment` command is used to e=
nable a
+fragment. When a fragment is enabled, the configuration variables of thi=
s
+fragment are parsed by :term:`BitBake` and their values are available gl=
obally
+in your build.
+
+From the list obtained with the :ref:`ref-bitbake-config-build-list-frag=
ments`
+command, you can determine which fragments can be enabled for your build=
.
+
+For example, the following command would enable the
+:ref:`ref-fragments-core-yocto-sstate-mirror-cdn` fragment::
+
+   bitbake-config-build enable-fragment core/yocto/sstate-mirror-cdn
+
+.. note::
+
+   Multiple fragments can be enabled at once with the same command::
+
+      bitbake-config-build enable-fragment <fragment1> <fragment2> ...
+
+:term:`Built-in fragments <Built-in Fragment>` are enabled the same way,=
 and
+their values are defined from the command-line directly. For example, th=
e
+following command sets the ``qemuarm64`` :term:`MACHINE` through the
+:ref:`ref-fragments-builtin-core-machine` fragment::
+
+   bitbake-config-build enable-fragment machine/qemuarm64
+
+This fragment can be overridden from the command-line by setting it to a=
nother
+value, for example::
+
+   bitbake-config-build enable-fragment machine/qemux86-64
+
+Note that in this case, the fragment will be defined twice in
+:term:`OE_FRAGMENTS`, and the last value is taken into account:
+
+.. code-block::
+   :caption: build/conf/auto.conf
+
+   OE_FRAGMENTS +=3D " ... machine/qemuarm64 machine/qemux86-64"
+
+In the above example, the value of :term:`MACHINE` is thus equal to
+``qemux86-64``.
+
+When a fragment is enabled with :ref:`ref-bitbake-config-build-enable-fr=
agment`,
+its name is automatically appended to the :term:`OE_FRAGMENTS` variable =
in
+:ref:`structure-build-conf-auto.conf`.
+
+.. note::
+
+   It is also possible to manually remove or add fragments by modifying =
the
+   :term:`OE_FRAGMENTS` variable in a configuration file such as
+   :ref:`structure-build-conf-local.conf`.
+
+.. _ref-bitbake-config-build-disable-fragment:
+
+``bitbake-config-build disable-fragment``
+-----------------------------------------
+
+Any fragment enabled with the :ref:`ref-bitbake-config-build-enable-frag=
ment`
+command can be disabled with the :ref:`ref-bitbake-config-build-disable-=
fragment`
+command. The list of enabled fragments can be obtained with
+:ref:`ref-bitbake-config-build-list-fragments`.
+
+For example, the following command disables the
+:ref:`ref-fragments-core-yocto-sstate-mirror-cdn` fragment::
+
+   bitbake-config-build disable-fragment core/yocto/sstate-mirror-cdn
+
+Likewise, :term:`Built-in Fragments <Built-in Fragment>` are disabled th=
e
+same way. For example, this would disable the ``machine/qemuarm64`` frag=
ment::
+
+   bitbake-config-build disable-fragment machine/qemuarm64
+
+.. note::
+
+   Multiple fragments can be disabled at once with the same command::
+
+      bitbake-config-build disable-fragment <fragment1> <fragment2>
+
+.. _ref-bitbake-config-build-disable-all-fragments:
+
+``bitbake-config-build disable-all-fragments``
+----------------------------------------------
+
+The :ref:`ref-bitbake-config-build-disable-all-fragments` command disabl=
es all of the
+currently enabled fragments.  The list of enabled fragments can be obtai=
ned with
+:ref:`ref-bitbake-config-build-list-fragments`.
+
+This command is run without arguments::
+
+   bitbake-config-build disable-all-fragments
+
+Core Fragments
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+
+Core Built-in Fragments
+-----------------------
+
+:term:`Built-in Fragments <Built-in Fragment>` are used to assign a sing=
le
+variable globally. The :term:`OpenEmbedded Build System` defines multipl=
e
+built-in fragments that are detailed in this section.
+
+.. _ref-fragments-builtin-core-machine:
+
+``machine/``
+~~~~~~~~~~~~
+
+The ``machine/`` :term:`built-in fragment` can be used to assign the val=
ue of
+the :term:`MACHINE` variable globally.
+
+.. _ref-fragments-builtin-core-distro:
+
+``distro/``
+~~~~~~~~~~~
+
+The ``distro/`` :term:`built-in fragment` can be used to assign the valu=
e of
+the :term:`DISTRO` variable globally.
+
+Core Configuration Fragments
+----------------------------
+
+Yocto Project Fragments
+~~~~~~~~~~~~~~~~~~~~~~~
+
+This group defines fragments related to the Yocto Project infrastructure=
 in
+general.
+
+.. _ref-fragments-core-yocto-sstate-mirror-cdn:
+
+``core/yocto/sstate-mirror-cdn``
+^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
+
+The ``core/yocto/sstate-mirror-cdn`` :term:`configuration fragment` can =
be used
+to set up :term:`BB_HASHSERVE_UPSTREAM` and :term:`SSTATE_MIRRORS` to us=
e
+pre-built :ref:`shared state cache <overview-manual/concepts:shared stat=
e
+cache>` artifacts for standard Yocto build configurations.
+
+This will mean the build will query the Yocto Project mirrors to check f=
or
+artifacts at the start of builds, which does slow it down initially but =
it will
+then speed up the builds by not having to build things if they are prese=
nt in
+the cache. It assumes you can download something faster than you can bui=
ld it
+which will depend on your network configuration.
+
+Yocto Project Autobuilder Fragments
+~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+This group defines fragment used for the Yocto Project Autobuilder. For =
details,
+see the :ref:`test-manual/intro:Yocto Project Autobuilder Overview` sect=
ion of
+the Yocto Project Test Environment Manual.
+
+.. _ref-fragment-core-yocto-autobuilder-autobuilder:
+
+``core/yocto-autobuilder/autobuilder``
+^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
+
+The ``core/yocto-autobuilder/autobuilder`` fragment defines common varia=
bles
+used in builds started by the Yocto Project Autobuilder.
+
+.. _ref-fragment-core-yocto-autobuilder-autobuilder-resource-constraints=
:
+
+``core/yocto-autobuilder/autobuilder-resource-constraints``
+^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
+
+The ``core/yocto-autobuilder/autobuilder`` fragment defines variables fo=
r
+limiting the resources used by the Yocto Project Autobuilder during buil=
ds. For
+more details on how to limit resources, see the :doc:`/dev-manual/limiti=
ng-resources`
+section of the Yocto Project Development Tasks Manual.
+
+.. _ref-fragment-core-yocto-autobuilder-multilib-mips64-n32:
+
+``core/yocto-autobuilder/multilib-mips64-n32``
+^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
+
+The ``core/yocto-autobuilder/multilib-mips64-n32`` fragment enables
+tri-architecture :ref:`multilib <dev-manual/libraries:Combining Multiple
+Versions of Library Files into One Image>` configurations for :wikipedia=
:`MIPS64
+<MIPS_architecture>` machines, which includes ``mips64-n32``, ``mips64``=
, and
+``mips32r2``.
+
+.. _ref-fragment-core-yocto-autobuilder-multilib-x86-lib32:
+
+``core/yocto-autobuilder/multilib-x86-lib32``
+^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
+
+The ``core/yocto-autobuilder/multilib-x86-lib32`` fragment enables
+:ref:`multilib <dev-manual/libraries:Combining Multiple Versions of Libr=
ary
+Files into One Image>` configurations for supporting 32-bit libraries on=
 64-bit
+:wikipedia:`X86 <X86>` builds.
+
+.. _ref-fragment-core-yocto-autobuilder-multilib-x86-lib64:
+
+``core/yocto-autobuilder/multilib-x86-lib64``
+^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
+
+The ``core/yocto-autobuilder/multilib-x86-lib64`` fragment enables
+:ref:`multilib <dev-manual/libraries:Combining Multiple Versions of Libr=
ary
+Files into One Image>` configurations for supporting 64-bit libraries on=
 32-bit
+:wikipedia:`X86 <X86>` builds.
diff --git a/documentation/ref-manual/index.rst b/documentation/ref-manua=
l/index.rst
index 53fa98cc9..aa1a63e05 100644
--- a/documentation/ref-manual/index.rst
+++ b/documentation/ref-manual/index.rst
@@ -17,6 +17,7 @@ Yocto Project Reference Manual
    structure
    classes
    tasks
+   fragments
    devtool-reference
    kickstart
    qa-checks
diff --git a/documentation/ref-manual/terms.rst b/documentation/ref-manua=
l/terms.rst
index f3d3d059d..e25c714d9 100644
--- a/documentation/ref-manual/terms.rst
+++ b/documentation/ref-manual/terms.rst
@@ -131,6 +131,53 @@ universal, the list includes them just in case:
       A variant of :term:`buildtools`, just providing the required
       version of ``make`` to run the OpenEmbedded build system.
=20
+   :term:`Built-in Fragment`
+      A built-in fragment is a specific kind of :term:`Configuration Fra=
gment`
+      that affects the value of a single variable globally. :term:`Built=
-in
+      Fragments <Built-in Fragment>` do not require a separate configura=
tion
+      file, but like a standard :term:`Configuration Fragment`, Built-in
+      Fragments can be enabled or disabled using the :oe_git:`bitbake-co=
nfig-build
+      </bitbake/tree/bin/bitbake-config-build>` command-line utility.
+
+      When declared, a built-in fragment follows the following naming
+      convention::
+
+         <fragment>:<variable name>
+
+      Where:
+
+      -  ``<fragment>`` is the name of the built-in fragment.
+      -  ``<variable name>`` is the name of the variable to be modified =
by this
+         fragment.
+
+      For example::
+
+         machine:MACHINE
+
+      Will setup the ``machine`` Built-in Fragment for modifying the val=
ue of
+      the :term:`MACHINE` variable.
+
+      Setting the :term:`MACHINE` variable through this fragment must fo=
llow
+      this syntax::
+
+         machine/qemux86-64
+
+      This sets the value of :term:`MACHINE` to ``qemux86-64``.
+
+      In :term:`OpenEmbedded-Core (OE-Core)`, the list of available
+      :term:`Built-in Fragments <Built-in Fragment>` can be obtained fro=
m the
+      :term:`OE_FRAGMENTS_BUILTIN` variable.
+
+      For more details on fragments, see:
+
+      -  The :doc:`/ref-manual/fragments` section of the Yocto Project R=
eference
+         Manual for a list of fragments the :term:`OpenEmbedded Build Sy=
stem`
+         supports, and a quick reference guide on how to manage fragment=
s.
+
+      -  The :doc:`/dev-manual/creating-fragments` section of the Yocto =
Project
+         Development Tasks Manual for details on how to create new fragm=
ents
+         in your build.
+
    :term:`Classes`
       Files that provide for logic encapsulation and inheritance so that
       commonly used patterns can be defined once and then easily used in
@@ -154,6 +201,51 @@ universal, the list includes them just in case:
       only used when building for that target (e.g. the
       :file:`machine/beaglebone.conf` configuration file defines variabl=
es for
       the Texas Instruments ARM Cortex-A8 development board).
+      :term:`Configuration Fragments <Configuration Fragment>` such as
+      :ref:`ref-fragments-core-yocto-sstate-mirror-cdn` define snippets =
of
+      configuration that can be enabled from the command-line.
+
+   :term:`Configuration Fragment`
+      A :term:`Configuration Fragment` (also called Standard :term:`Conf=
iguration
+      Fragment`) is a :term:`configuration file` that contains configura=
tion
+      statements such as variable assignments, affecting the build at a
+      global-level when the fragment is enabled. By default, configurati=
on
+      fragments are located in the :file:`conf/fragments/` directory of =
a
+      :term:`Layer`.
+
+      .. note::
+
+         Another form of fragment not to be confounded with Standard
+         :term:`Configuration Fragments <Configuration Fragment>` are
+         :term:`Built-in Fragments <Built-in Fragment>` which are used t=
o assign
+         a single variable value globally.
+
+      A fragment :term:`configuration file` must contain a summary
+      (:term:`BB_CONF_FRAGMENT_SUMMARY`) and a description
+      (:term:`BB_CONF_FRAGMENT_DESCRIPTION`) explaining the purpose of t=
he
+      fragment.
+
+      In :term:`OpenEmbedded-Core (OE-Core)`, the location of fragments =
and what
+      variables are required in a fragment is specified in :oe_git:`bitb=
ake.conf
+      </openembedded-core/tree/meta/conf/bitbake.conf>` thanks to the
+      :ref:`addfragments <bitbake-user-manual/bitbake-user-manual-metada=
ta:\`\`addfragments\`\`
+      directive>` directive and the :term:`OE_FRAGMENTS`,
+      :term:`OE_FRAGMENTS_METADATA_VARS` and :term:`OE_FRAGMENTS_BUILTIN=
`
+      variables.
+
+      Fragments can be listed, enabled and disabled with the
+      :oe_git:`bitbake-config-build </bitbake/tree/bin/bitbake-config-bu=
ild>`
+      command-line utility.
+
+      For more details on fragments, see:
+
+      -  The :doc:`/ref-manual/fragments` section of the Yocto Project R=
eference
+         Manual for a list of fragments the :term:`OpenEmbedded Build Sy=
stem`
+         supports, and a quick reference guide on how to manage fragment=
s.
+
+      -  The :doc:`/dev-manual/creating-fragments` section of the Yocto =
Project
+         Development Tasks Manual for details on how to create new fragm=
ents
+         in your build.
=20
    :term:`Container Layer`
       A flexible definition that typically refers to a single Git checko=
ut
diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-m=
anual/variables.rst
index 18ead7d04..57dc71ed8 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -397,6 +397,18 @@ system and gives an overview of their function and c=
ontents.
    :term:`BB_CHECK_SSL_CERTS`
       See :term:`bitbake:BB_CHECK_SSL_CERTS` in the BitBake manual.
=20
+   :term:`BB_CONF_FRAGMENT_DESCRIPTION`
+      The :term:`BB_CONF_FRAGMENT_DESCRIPTION` variable defines the text=
ual
+      description of a :term:`Configuration Fragment`. For details on ho=
w to use
+      fragments, see the :doc:`/ref-manual/fragments` section of the Yoc=
to
+      Project Reference Manual.
+
+   :term:`BB_CONF_FRAGMENT_SUMMARY`
+      The :term:`BB_CONF_FRAGMENT_SUMMARY` variable defines the one-line=
 textual
+      summary of a :term:`Configuration Fragment`. For details on how to=
 use
+      fragments, see the :doc:`/ref-manual/fragments` section of the Yoc=
to
+      Project Reference Manual.
+
    :term:`BB_CONSOLELOG`
       See :term:`bitbake:BB_CONSOLELOG` in the BitBake manual.
=20
@@ -6231,6 +6243,33 @@ system and gives an overview of their function and=
 contents.
       :term:`Source Directory` for details on how this class
       applies these additional sed command arguments.
=20
+   :term:`OE_FRAGMENTS`
+      The :term:`OE_FRAGMENTS` variable holds the list of :term:`Configu=
ration
+      Fragments <Configuration Fragment>` currently enabled for the buil=
d. For
+      details on how to use fragments, see the :doc:`/ref-manual/fragmen=
ts`
+      section of the Yocto Project Reference Manual.
+
+   :term:`OE_FRAGMENTS_BUILTIN`
+      The :term:`OE_FRAGMENTS_BUILTIN` variable holds the list of
+      :term:`Built-in Fragments <Built-in Fragment>` available for being=
 set with
+      :oe_git:`bitbake-config-build </bitbake/tree/bin/bitbake-config-bu=
ild>`.
+      For details on how to use fragments, see the :doc:`/ref-manual/fra=
gments`
+      section of the Yocto Project Reference Manual.
+
+   :term:`OE_FRAGMENTS_METADATA_VARS`
+      The :term:`OE_FRAGMENTS_METADATA_VARS` variable holds the list of
+      variables that are required to set in a standard :term:`Configurat=
ion
+      Fragment` file. In :term:`OpenEmbedded-Core (OE-Core)`, these vari=
ables
+      are :term:`BB_CONF_FRAGMENT_SUMMARY` and
+      :term:`BB_CONF_FRAGMENT_DESCRIPTION`.
+
+   :term:`OE_FRAGMENTS_PREFIX`
+      The :term:`OE_FRAGMENTS_PREFIX` variable defines the prefix where
+      :term:`BitBake` tries to locate :term:`Configuration Fragments
+      <Configuration Fragment>` in :term:`layers <Layer>`. For details o=
n how to
+      use fragments, see the :doc:`/ref-manual/fragments` section of the=
 Yocto
+      Project Reference Manual.
+
    :term:`OE_INIT_ENV_SCRIPT`
       The name of the build environment setup script for the purposes of
       setting up the environment within the extensible SDK. The default

--=20
2.51.0


