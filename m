Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB7F2CAC5A7
	for <webhook@archiver.kernel.org>; Thu, 25 Sep 2025 11:07:58 +0000 (UTC)
Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
 by mx.groups.io with SMTP id smtpd.web10.8769.1758798473250828556
 for <docs@lists.yoctoproject.org>;
 Thu, 25 Sep 2025 04:07:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=fliBS6KL;
 spf=pass (domain: gmail.com, ip: 209.85.160.171, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qt1-f171.google.com with SMTP id d75a77b69052e-4d9f7a34daaso6712831cf.0
        for <docs@lists.yoctoproject.org>; Thu, 25 Sep 2025 04:07:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758798472; x=1759403272; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IlIeJX+N6ovuvYTTnSnb7oBYBM6aaeEuUOEPIXHYKzk=;
        b=fliBS6KLk7hKJar0dyk1KvbClB4j5Eg4XN9DYGkXPkoo5dSoTsY6Xqw5R/MFcmVTnO
         tOQtIF6UlflKBla2z+925F+Gm7VJIM0Bel5HyrXYVCFWapaSlZdgC7WBYt/z9YJE4Lxc
         hxQboyUgZ+yNvz5p5xN9b0yR4oLjRPunObShUiluR25PLfH08ADIXyxSLPJKIAwDT6rs
         +ELg1ZYDDCz0QEDeTGDeUIU2ThL7WnFb0UcNFVkf7paaMKFctUnJ3wFuo1NibkOAnZkz
         vi8S/NmzIMBGKCb/35UvhBAx1tOGlcb8XSc+Odj8L5pVwqpPeu5Swan44yKxTEe2C9Pa
         K2sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758798472; x=1759403272;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IlIeJX+N6ovuvYTTnSnb7oBYBM6aaeEuUOEPIXHYKzk=;
        b=hVj3TuZXpAoDap+2EHyOBuAuetFl9459xnglKDrUZXlcx5y+nYl9rVnIaIoQlDq0+n
         WokIhhubxd3an6EzYI/gNh4MBHGTBE7fU7opxO0taH4Ox3nl/JqZPg4hfbyu/VR9A1zg
         bwjfvLGcI4pdBQs9VjnxDszSZ9zrhWzjMW3IS9HH53i37OhRdU3jbmb8euQ45MlkctPL
         SbAEJH0x32IBe/TmwOTHwb6PGMdNNhcWhF0H/VIzqcMxFe3J/xUxDVbstnt9Enm8otWE
         Ri4vEm8NMCxd+b5Fu3MZasXcpvtDl0Sd3KUxcclLIFUpK9Mqtq0fhvWKNv+mx8R3mX09
         ULBA==
X-Gm-Message-State: AOJu0Yz7Old/Cm6GNfdjPbtuuGaUdJCZ9s1nbEytsg4uUXnJRjmlTJQY
	j+6vQBGBfqKKjScje7wnNpXU8jscpy+4Y5OZdQYma/WxZyo7uXwgKDm3elkwcMyD+88LLA8mmf1
	pSzjGpRa7Ri+JBxJ3AkMVEMAN7kOYIYQ=
X-Gm-Gg: ASbGncve9XTHmV2xmmUX7kpGkShNHavKJKc4rPO9fwJH/Egj8cmdRqkpCeyhmdrwamg
	GMtBFiMPlXrKxaPVEt02E01yC7kPlxJcB8CpMS20vDR1/wTGtlbyUVIFyV0I/27GnQdRKcxCQtb
	jfo/+lxlbF7j9ykA1vJVU3WsSocavO6PFARrlmlaIR2EOTWEH14WghQfNyGKo9s11tsfeWeZb40
	ed4Sxq4JhMLmyIKzWaaEoZtdx16zudqNZVpPJ4XaT94OIpWaDIL4Lq4AvhkQCPItrlGi3Tikw0e
	5FFHmCoNjW/8EDr0jaIuzDRy+LKJRFTJEhDO8+As
X-Google-Smtp-Source: AGHT+IFvEjeBVrhTuhaRi6/q9kZwHoCz+9B93qdgh1wygE2XoKSk33Eq2vFLNx0lmVrvPa3Qft84WHBQF+sorgFJB/I=
X-Received: by 2002:a05:622a:2609:b0:4b2:f92f:7ee5 with SMTP id
 d75a77b69052e-4da4744f295mr30601631cf.5.1758798472039; Thu, 25 Sep 2025
 04:07:52 -0700 (PDT)
MIME-Version: 1.0
References: <20250925-fragments-v1-0-c9f747361fb2@bootlin.com> <20250925-fragments-v1-2-c9f747361fb2@bootlin.com>
In-Reply-To: <20250925-fragments-v1-2-c9f747361fb2@bootlin.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 25 Sep 2025 13:07:41 +0200
X-Gm-Features: AS18NWBXV0s2kKAmYcPe27R3e9ETibkSO9D-dlkX4hosZp0ovXNEJwLl64GTeC8
Message-ID: <CANNYZj8jYz3vCRpyCqL5MFqGuMmWhdiw8kn7ozrinyRDgE9pNw@mail.gmail.com>
Subject: Re: [PATCH 2/2] Add documentation on fragments
To: Antonin Godard <antonin.godard@bootlin.com>
Cc: docs@lists.yoctoproject.org, 
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Tim Orling <tim.orling@konsulko.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 25 Sep 2025 11:07:58 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7597

On Thu, 25 Sept 2025 at 09:29, Antonin Godard
<antonin.godard@bootlin.com> wrote:
>
> - terms.rst: Provide the definitions of a Configuration Fragment and a
>   Built-in Fragment.
> - ref-manual: Add a quick reference guide on bitbake-config-build, and
>   list the available fragments in OE-Core.
>   Document the underlying variables related to fragments in the
>   glossary.
> - dev-manual: give instructions on how to create new custom fragments.

Thanks for writing these up. It's mostly fine, but I do have a few comments=
.

> +Using Configuration Fragments In Your Build
> +*******************************************

What follows is not about using fragments (e.g. enabling/disabling
them), it's about making new fragments. I think the section should be
titled accordingly.

> +The Yocto Project supports enabling and disable some configuration varia=
bles
> +through :term:`Configuration Fragments <Configuration Fragment>`. This m=
echanism
> +allows modifying the top-level configuration of a build from the command=
-line
> +using the :oe_git:`bitbake-config-build </bitbake/tree/bin/bitbake-confi=
g-build>`
> +tool. This section will describe how to create new fragments for your bu=
ilds.

I think here and elsewhere (where you need to explain what fragments
are) it's good to introduce fragments like this:
'Fragments define top level build configuration features that can be
independently enabled and disabled using standard tooling. Such
features are made of one or several build configuration statements
that are either contained in a fragment file, or are set indirectly
using the built-in fragment mechanism. '.

> +There are two kinds of configuration fragments:
> +
> +-  :term:`Configuration Fragments <Configuration Fragment>` which a stor=
ed
> +   in a file. These fragment include a summary and a description.

Spelling issues. They are also in some other places, I won't nit-pick
on those. Let's get the content correct first.

'Standard :term:`Configuration Fragments <Configuration Fragment>`
which are defined in a file. These fragments include a summary and a
description, followed by configuration statements.

> +-  :term:`Built-in Fragments <Built-in Fragment>` which are used to set =
a
> +   variable value.

... which can be used to assign a value to a single variable and do
not require a separate definition file. They are especially useful
when a list of possible values is very long (or infinite).

> +Creating new :term:`Built-in Fragments <Built-in Fragment>` is not suppo=
rted.

I think it is, but that requires putting an additional addfragment
statement somewhere, or some way to append to OE_FRAGMENTS_BUILTIN
*before* the oe-core's addfragments is processed.

> +You should instead create :term:`Configuration Fragment` files as docume=
nted
> +below to customize a build to your need.

I would try to describe adding built-in fragments as well.

> +Creating A Configuration Fragment File
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +By default, all configuration fragments are located within the
> +``conf/fragments`` directory of a :term:`layer`. This location is define=
d by the
> +:term:`OE_FRAGMENTS_PREFIX` variable.

... which, in turn, is used as a parameter in a addfragments statement
in meta/conf/bitbake.conf

> +You can create one or more :term:`configuration fragment` files in your
> +:term:`layer` in this directory. Let's take the following example, where
> +``custom-fragment.conf`` is our custom fragment file::
> +
> +   meta-custom
> +   =E2=94=9C=E2=94=80=E2=94=80 conf
> +   =E2=94=82   =E2=94=9C=E2=94=80=E2=94=80 fragments
> +   =E2=94=82   =E2=94=82   =E2=94=94=E2=94=80=E2=94=80 custom-fragment.c=
onf
> +   =E2=94=82   =E2=94=94=E2=94=80=E2=94=80 layer.conf
> +   ...
> +
> +For our ``custom-fragment.conf`` file, the following variables **must** =
be set
> +for our fragment to be considered a valid fragment by the :term:`OpenEmb=
edded
> +Build System`:
> +
> +-  :term:`BB_CONF_FRAGMENT_SUMMARY`: a one-line summary of this fragment=
.
> +
> +-  :term:`BB_CONF_FRAGMENT_DESCRIPTION`: a description of this fragment.

These are again defined through a parameter to addfragments, so it
would be good to reference that.

> +After creating these variables, our custom fragment should look like the
> +following:
> +
> +.. code-block::
> +   :caption: custom-fragment.conf
> +
> +   BB_CONF_FRAGMENT_SUMMARY =3D "My custom fragment summary"
> +   BB_CONF_FRAGMENT_DESCRIPTION =3D "My custom fragment description, \
> +   which can be multiple lines."

"This fragment sets a limit of 4 bitbake threads and 4 parsing threads."
"This fragment is useful to constrain resource consumption when the
Yocto default \
 is causing an overload of host machine's memory and cpu resources."

> +***********************
> +Configuration Fragments

Using configuration fragments.


> +***********************
> +
> +:term:`Configuration Fragments <Configuration Fragment>` are used to pro=
vide a
> +snippet of global configuration that can be enabled or disabled for a bu=
ild.
> +This document provides a quick reference of the :oe_git:`bitbake-config-=
build
> +</bitbake/tree/bin/bitbake-config-build>` tool and lists the
> +:term:`Configuration Fragments <Configuration Fragment>` and :term:`Buil=
t-in
> +Fragments <Built-in Fragment>` available in the :term:`OpenEmbedded Buil=
d
> +System` core repositories.

See above how the fragments could be introduced.

> +When a fragment is enabled with :ref:`ref-bitbake-config-build-enable-fr=
agment`,
> +its name is automatically appended to the :term:`OE_FRAGMENTS` variable =
in
> +:ref:`structure-build-conf-auto.conf`.

It is also possible (but not recommended) to manually add to this
variable from local.conf.

> +   :term:`Built-in Fragment`
> +      A built-in fragment is a specific kind of :term:`Configuration Fra=
gment`
> +      that affects the value of a single variable globally. Like
> +      a normal :term:`Configuration Fragment`, Built-in Fragments can be=
 enabled
> +      or disabled using the :oe_git:`bitbake-config-build </bitbake/tree=
/bin/bitbake-config-build>`
> +      command-line utility.
> +
> +      When declared, a built-in fragment follows the following naming
> +      convention::
> +
> +         <fragment>:<variable name>
> +
> +      Where:
> +
> +      -  ``<fragment>`` is the name of the built-in fragment.
> +      -  ``<variable name>`` is the name of the variable to be modified =
by this
> +         fragment.
> +
> +      For example::
> +
> +         machine:MACHINE
> +
> +      Will setup the ``machine`` Built-in Fragment for modifying the val=
ue of
> +      the :term:`MACHINE` variable.
> +
> +      Setting the :term:`MACHINE` variable through this fragment must fo=
llow
> +      this syntax::
> +
> +         machine/qemux86-64
> +
> +      This sets the value of :term:`MACHINE` to ``qemux86-64``.
> +
> +      For more details on fragments, see:
> +
> +      -  The :doc:`/ref-manual/fragments` section of the Yocto Project R=
eference
> +         Manual for a list of fragments the :term:`OpenEmbedded Build Sy=
stem`
> +         supports, and a quick reference guide on how to manage fragment=
s.
> +
> +      -  The :doc:`/dev-manual/using-fragments` section of the Yocto Pro=
ject
> +         Development Tasks Manual for details on how to create new fragm=
ents
> +         in your build.

Two more points need to be made:

- built-in fragments can be used to assign a value to a single
variable and do not require a separate definition file. They are
especially useful when a list of possible values is very long (or
infinite), as that avoids making large amounts of fragment files, all
very similar to each other.

- the definition of available built-in fragments is in meta/conf/bitbake.co=
nf:
OE_FRAGMENTS_BUILTIN ?=3D "machine:MACHINE distro:DISTRO"

In turn, what variable contains the definition is specified in the
addfragments directive in the same file:
addfragments ${OE_FRAGMENTS_PREFIX} OE_FRAGMENTS
OE_FRAGMENTS_METADATA_VARS OE_FRAGMENTS_BUILTIN

>     :term:`Classes`
>        Files that provide for logic encapsulation and inheritance so that
>        commonly used patterns can be defined once and then easily used in
> @@ -154,6 +196,37 @@ universal, the list includes them just in case:
>        only used when building for that target (e.g. the
>        :file:`machine/beaglebone.conf` configuration file defines variabl=
es for
>        the Texas Instruments ARM Cortex-A8 development board).
> +      :term:`Configuration Fragments <Configuration Fragment>` such as
> +      :ref:`ref-fragments-core-yocto-sstate-mirror-cdn` define snippets =
of
> +      configuration that can be enabled from the command-line.
> +
> +   :term:`Configuration Fragment`
> +      A configuration fragment is a :term:`Configuration File` that cont=
ains
> +      variable assignments affecting the build at a global-level when th=
e

And directives, such as 'require ...'. I'd instead say 'configuration
statements, such as variable assignments'.

> +      fragment is enabled. By default, configuration fragments are locat=
ed in
> +      the :file:`conf/fragments/` directory of a :term:`Layer`.
> +
> +      A fragment :term:`configuration file` must contain a summary
> +      (:term:`BB_CONF_FRAGMENT_SUMMARY`) and a description
> +      (:term:`BB_CONF_FRAGMENT_DESCRIPTION`) explaining the purpose of t=
he
> +      fragment.

In oe-core, the location of fragments and what variables are required
in a fragment is specified via meta/conf/bitbake.conf:

OE_FRAGMENTS_PREFIX ?=3D "conf/fragments"
OE_FRAGMENTS_METADATA_VARS ?=3D "BB_CONF_FRAGMENT_SUMMARY
BB_CONF_FRAGMENT_DESCRIPTION"
addfragments ${OE_FRAGMENTS_PREFIX} OE_FRAGMENTS
OE_FRAGMENTS_METADATA_VARS OE_FRAGMENTS_BUILTIN


Thanks!

Alex

