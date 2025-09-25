Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3EC0CCAC5A7
	for <webhook@archiver.kernel.org>; Thu, 25 Sep 2025 13:33:20 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.web11.11838.1758807197870796434
 for <docs@lists.yoctoproject.org>;
 Thu, 25 Sep 2025 06:33:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=GHX1uuCb;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 962DAC011E6
	for <docs@lists.yoctoproject.org>; Thu, 25 Sep 2025 13:32:58 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id DB6F06062C;
	Thu, 25 Sep 2025 13:33:15 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id E1424102F1799;
	Thu, 25 Sep 2025 15:33:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1758807195; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=bM+U+ZqCkJgctC/V7wdKoIbR+aZfxy/VAagzFnxGXHY=;
	b=GHX1uuCbFS7dGc6fUQrxoGGfd/xLuQs/uyO9sz7zxceqjbdhs2T6Gc6gkKejUvb4mdFjz2
	IHSVuJ8AQraiQZAaisd8ZROJzguhKsdF0qOVwEsYSB/TZl3wDSnEZom6vS+5WvpppEAhHr
	RVjo7u2uqXVJoeCZwQd/MoZbUYq2DaAaIxoq5tBi6Efi5pTJTS0FDRO3rosLv9Bt+ll34i
	jQIH3ZpC69uvthK4GJB0k06oAP2le0kIyx5sAuOOwGCFiLX6q7LNpBLikxvOeV/Fjrm1c2
	RUqdsB92Hkq25Woq0kXitllyhy/PCxNxh2e9OcoDkXrQuQzhXaoZtnTRyMHeSg==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 25 Sep 2025 15:33:13 +0200
Message-Id: <DD1X469V0SJH.6I9PBV2QL3WJ@bootlin.com>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: "Alexander Kanavin" <alex.kanavin@gmail.com>
Subject: Re: [PATCH 2/2] Add documentation on fragments
Cc: <docs@lists.yoctoproject.org>, "Thomas Petazzoni"
 <thomas.petazzoni@bootlin.com>, "Tim Orling" <tim.orling@konsulko.com>
References: <20250925-fragments-v1-0-c9f747361fb2@bootlin.com>
 <20250925-fragments-v1-2-c9f747361fb2@bootlin.com>
 <CANNYZj8jYz3vCRpyCqL5MFqGuMmWhdiw8kn7ozrinyRDgE9pNw@mail.gmail.com>
In-Reply-To: <CANNYZj8jYz3vCRpyCqL5MFqGuMmWhdiw8kn7ozrinyRDgE9pNw@mail.gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 25 Sep 2025 13:33:20 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7599

On Thu Sep 25, 2025 at 1:07 PM CEST, Alexander Kanavin wrote:
> On Thu, 25 Sept 2025 at 09:29, Antonin Godard
> <antonin.godard@bootlin.com> wrote:
>>
>> - terms.rst: Provide the definitions of a Configuration Fragment and a
>>   Built-in Fragment.
>> - ref-manual: Add a quick reference guide on bitbake-config-build, and
>>   list the available fragments in OE-Core.
>>   Document the underlying variables related to fragments in the
>>   glossary.
>> - dev-manual: give instructions on how to create new custom fragments.
>
> Thanks for writing these up. It's mostly fine, but I do have a few commen=
ts.
>
>> +Using Configuration Fragments In Your Build
>> +*******************************************
>
> What follows is not about using fragments (e.g. enabling/disabling
> them), it's about making new fragments. I think the section should be
> titled accordingly.

Right, this turned out to be a document different from my initial draft and
forgot to update the title. Thanks for spotting this.

>> +The Yocto Project supports enabling and disable some configuration vari=
ables
>> +through :term:`Configuration Fragments <Configuration Fragment>`. This =
mechanism
>> +allows modifying the top-level configuration of a build from the comman=
d-line
>> +using the :oe_git:`bitbake-config-build </bitbake/tree/bin/bitbake-conf=
ig-build>`
>> +tool. This section will describe how to create new fragments for your b=
uilds.
>
> I think here and elsewhere (where you need to explain what fragments
> are) it's good to introduce fragments like this:
> 'Fragments define top level build configuration features that can be
> independently enabled and disabled using standard tooling. Such
> features are made of one or several build configuration statements
> that are either contained in a fragment file, or are set indirectly
> using the built-in fragment mechanism. '.

Ok, I felt that I needed a good catch phrase on fragments to put in differe=
nt
places - I'll use that one.

>> +There are two kinds of configuration fragments:
>> +
>> +-  :term:`Configuration Fragments <Configuration Fragment>` which a sto=
red
>> +   in a file. These fragment include a summary and a description.
>
> Spelling issues. They are also in some other places, I won't nit-pick
> on those. Let's get the content correct first.
>
> 'Standard :term:`Configuration Fragments <Configuration Fragment>`
> which are defined in a file. These fragments include a summary and a
> description, followed by configuration statements.

Thanks for your feedback on this. I had a struggle whether we should name
fragments in file "standard" or "regular", or just "fragments". I think sta=
ndard
is good.

>> +-  :term:`Built-in Fragments <Built-in Fragment>` which are used to set=
 a
>> +   variable value.
>
> ... which can be used to assign a value to a single variable and do
> not require a separate definition file. They are especially useful
> when a list of possible values is very long (or infinite).
>
>> +Creating new :term:`Built-in Fragments <Built-in Fragment>` is not supp=
orted.
>
> I think it is, but that requires putting an additional addfragment
> statement somewhere, or some way to append to OE_FRAGMENTS_BUILTIN
> *before* the oe-core's addfragments is processed.

Yes exactly, I did have some struggle yesterday so in the meantime wrote th=
is.
But I know it can be supported.

>> +You should instead create :term:`Configuration Fragment` files as docum=
ented
>> +below to customize a build to your need.
>
> I would try to describe adding built-in fragments as well.

I tried but failed to have something consistent yesterday.

Setting it from a distro configuration file, or any configuration file that
comes after the addfragments call in bitbake.conf does not work in my
experience. Moving the addfragments call after the distro file include is n=
ot
possible as the the distro/ builtin fragment sets the DISTRO (chicken and e=
gg
problem :)).

There are multiple solutions:

- Telling users to define their custom builtin fragments in local.conf,
  auto.conf, site.conf, or any file that comes before the addfragments call=
.
  This is not desirable because this means we don't encourage to share
  configurations.

- Telling users to defines their builtin fragments in layer.conf. This work=
s,
  but this means layers can "pollute" the existing builtin fragments by
  overriding them when added to bblayers.conf. Other built-in fragments tha=
t have
  different names (not machine/ or distro/) is fine I guess, because
  just declaring a fragment as available does not affect the build.

  Maybe this could be reasonable, but we enforce layer maintainers to _not_
  override core built-in fragments (yocto-check-layer test, maybe?)

- One idea I had was to introduce an `addbuiltinfragments FRAGMENTS_BUILTIN=
`
  directive. This way we handle standard and built-in fragments separately.
  This turns out to be difficult as well, as standard and built-in fragment=
s
  are mixed in together in OE_FRAGMENTS.

I feel like our best option is option 2 here. What do you think? Other idea=
s
maybe?

>> +Creating A Configuration Fragment File
>> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>> +
>> +By default, all configuration fragments are located within the
>> +``conf/fragments`` directory of a :term:`layer`. This location is defin=
ed by the
>> +:term:`OE_FRAGMENTS_PREFIX` variable.
>
> ... which, in turn, is used as a parameter in a addfragments statement
> in meta/conf/bitbake.conf
>
>> +You can create one or more :term:`configuration fragment` files in your
>> +:term:`layer` in this directory. Let's take the following example, wher=
e
>> +``custom-fragment.conf`` is our custom fragment file::
>> +
>> +   meta-custom
>> +   =E2=94=9C=E2=94=80=E2=94=80 conf
>> +   =E2=94=82   =E2=94=9C=E2=94=80=E2=94=80 fragments
>> +   =E2=94=82   =E2=94=82   =E2=94=94=E2=94=80=E2=94=80 custom-fragment.=
conf
>> +   =E2=94=82   =E2=94=94=E2=94=80=E2=94=80 layer.conf
>> +   ...
>> +
>> +For our ``custom-fragment.conf`` file, the following variables **must**=
 be set
>> +for our fragment to be considered a valid fragment by the :term:`OpenEm=
bedded
>> +Build System`:
>> +
>> +-  :term:`BB_CONF_FRAGMENT_SUMMARY`: a one-line summary of this fragmen=
t.
>> +
>> +-  :term:`BB_CONF_FRAGMENT_DESCRIPTION`: a description of this fragment=
.
>
> These are again defined through a parameter to addfragments, so it
> would be good to reference that.

My initial approach was to document this as if a user did not need to have
custom addfragments calls and all that was required was to place fragment f=
iles
in the good spot in their layer, and modify OE_FRAGMENTS_BUILTIN as needed
(turns the second use case is not that easy in the end).

For example, we don't make the location of machine configurations configura=
ble
AFAIK - why would changing the location of fragments be needed for users of=
 OE?

But I can add references to this command, I just don't think we should emph=
asize
too much on it.

>> +After creating these variables, our custom fragment should look like th=
e
>> +following:
>> +
>> +.. code-block::
>> +   :caption: custom-fragment.conf
>> +
>> +   BB_CONF_FRAGMENT_SUMMARY =3D "My custom fragment summary"
>> +   BB_CONF_FRAGMENT_DESCRIPTION =3D "My custom fragment description, \
>> +   which can be multiple lines."
>
> "This fragment sets a limit of 4 bitbake threads and 4 parsing threads."
> "This fragment is useful to constrain resource consumption when the
> Yocto default \
>  is causing an overload of host machine's memory and cpu resources."

Thanks :) I could have made the extra effort here!

>> +***********************
>> +Configuration Fragments
>
> Using configuration fragments.
>
>
>> +***********************
>> +
>> +:term:`Configuration Fragments <Configuration Fragment>` are used to pr=
ovide a
>> +snippet of global configuration that can be enabled or disabled for a b=
uild.
>> +This document provides a quick reference of the :oe_git:`bitbake-config=
-build
>> +</bitbake/tree/bin/bitbake-config-build>` tool and lists the
>> +:term:`Configuration Fragments <Configuration Fragment>` and :term:`Bui=
lt-in
>> +Fragments <Built-in Fragment>` available in the :term:`OpenEmbedded Bui=
ld
>> +System` core repositories.
>
> See above how the fragments could be introduced.
>
>> +When a fragment is enabled with :ref:`ref-bitbake-config-build-enable-f=
ragment`,
>> +its name is automatically appended to the :term:`OE_FRAGMENTS` variable=
 in
>> +:ref:`structure-build-conf-auto.conf`.
>
> It is also possible (but not recommended) to manually add to this
> variable from local.conf.

Will mention this

>> +   :term:`Built-in Fragment`
>> +      A built-in fragment is a specific kind of :term:`Configuration Fr=
agment`
>> +      that affects the value of a single variable globally. Like
>> +      a normal :term:`Configuration Fragment`, Built-in Fragments can b=
e enabled
>> +      or disabled using the :oe_git:`bitbake-config-build </bitbake/tre=
e/bin/bitbake-config-build>`
>> +      command-line utility.
>> +
>> +      When declared, a built-in fragment follows the following naming
>> +      convention::
>> +
>> +         <fragment>:<variable name>
>> +
>> +      Where:
>> +
>> +      -  ``<fragment>`` is the name of the built-in fragment.
>> +      -  ``<variable name>`` is the name of the variable to be modified=
 by this
>> +         fragment.
>> +
>> +      For example::
>> +
>> +         machine:MACHINE
>> +
>> +      Will setup the ``machine`` Built-in Fragment for modifying the va=
lue of
>> +      the :term:`MACHINE` variable.
>> +
>> +      Setting the :term:`MACHINE` variable through this fragment must f=
ollow
>> +      this syntax::
>> +
>> +         machine/qemux86-64
>> +
>> +      This sets the value of :term:`MACHINE` to ``qemux86-64``.
>> +
>> +      For more details on fragments, see:
>> +
>> +      -  The :doc:`/ref-manual/fragments` section of the Yocto Project =
Reference
>> +         Manual for a list of fragments the :term:`OpenEmbedded Build S=
ystem`
>> +         supports, and a quick reference guide on how to manage fragmen=
ts.
>> +
>> +      -  The :doc:`/dev-manual/using-fragments` section of the Yocto Pr=
oject
>> +         Development Tasks Manual for details on how to create new frag=
ments
>> +         in your build.
>
> Two more points need to be made:
>
> - built-in fragments can be used to assign a value to a single
> variable and do not require a separate definition file. They are
> especially useful when a list of possible values is very long (or
> infinite), as that avoids making large amounts of fragment files, all
> very similar to each other.
>
> - the definition of available built-in fragments is in meta/conf/bitbake.=
conf:
> OE_FRAGMENTS_BUILTIN ?=3D "machine:MACHINE distro:DISTRO"
>
> In turn, what variable contains the definition is specified in the
> addfragments directive in the same file:
> addfragments ${OE_FRAGMENTS_PREFIX} OE_FRAGMENTS
> OE_FRAGMENTS_METADATA_VARS OE_FRAGMENTS_BUILTIN

Will add that

>>     :term:`Classes`
>>        Files that provide for logic encapsulation and inheritance so tha=
t
>>        commonly used patterns can be defined once and then easily used i=
n
>> @@ -154,6 +196,37 @@ universal, the list includes them just in case:
>>        only used when building for that target (e.g. the
>>        :file:`machine/beaglebone.conf` configuration file defines variab=
les for
>>        the Texas Instruments ARM Cortex-A8 development board).
>> +      :term:`Configuration Fragments <Configuration Fragment>` such as
>> +      :ref:`ref-fragments-core-yocto-sstate-mirror-cdn` define snippets=
 of
>> +      configuration that can be enabled from the command-line.
>> +
>> +   :term:`Configuration Fragment`
>> +      A configuration fragment is a :term:`Configuration File` that con=
tains
>> +      variable assignments affecting the build at a global-level when t=
he
>
> And directives, such as 'require ...'. I'd instead say 'configuration
> statements, such as variable assignments'.

Indeed, thanks.

>> +      fragment is enabled. By default, configuration fragments are loca=
ted in
>> +      the :file:`conf/fragments/` directory of a :term:`Layer`.
>> +
>> +      A fragment :term:`configuration file` must contain a summary
>> +      (:term:`BB_CONF_FRAGMENT_SUMMARY`) and a description
>> +      (:term:`BB_CONF_FRAGMENT_DESCRIPTION`) explaining the purpose of =
the
>> +      fragment.
>
> In oe-core, the location of fragments and what variables are required
> in a fragment is specified via meta/conf/bitbake.conf:
>
> OE_FRAGMENTS_PREFIX ?=3D "conf/fragments"
> OE_FRAGMENTS_METADATA_VARS ?=3D "BB_CONF_FRAGMENT_SUMMARY
> BB_CONF_FRAGMENT_DESCRIPTION"
> addfragments ${OE_FRAGMENTS_PREFIX} OE_FRAGMENTS
> OE_FRAGMENTS_METADATA_VARS OE_FRAGMENTS_BUILTIN
>

I usually don't include code snippets from OE-Core as it is harder to maint=
ain,
but I can reference the variable and location, this should be similar witho=
ut
the maintenance burden.

> Thanks!
>
> Alex

Antonin

--=20
Antonin Godard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


