Received: from mail-oi1-f170.google.com (mail-oi1-f170.google.com [209.85.167.170])
 by mx.groups.io with SMTP id smtpd.web08.33006.1607944508671009087
 for <docs@lists.yoctoproject.org>;
 Mon, 14 Dec 2020 03:15:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=FHLkcRDV;
 spf=pass (domain: konsulko.com, ip: 209.85.167.170, mailfrom: paul.barker@konsulko.com)
Received: by mail-oi1-f170.google.com with SMTP id q205so6054058oig.13
        for <docs@lists.yoctoproject.org>; Mon, 14 Dec 2020 03:15:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=LCQw4xz3rsDDBlITCk87sqLWY31vGxAm5xtmtAF12aM=;
        b=FHLkcRDVKeNZbSZBI9iGLz9hko4UsQZHEsdKcFu0kCvbfrDKOS7wjnavLfzp0tLm/U
         F/A9HfmuWi2YYG4OP/DlPimkmdvWTmdOjnuENoI5A0DFX164z6Kd/sB/0IWsC63nQF0L
         9xG7es2hC4pkdCjqkZYR6kf9qjC2OS3elDa+k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=LCQw4xz3rsDDBlITCk87sqLWY31vGxAm5xtmtAF12aM=;
        b=ggjC65fPMUWeqMQYrqRroZX7NrggnHy0YLbnGVG4r7NcuSzwTpNoCII9uVeswR1KuO
         UgUOIOEboidUcwqmq6k26oqbVMitSYfokgyT1Iv7U2YrcpXL9r1bO6Y4/lWlZg/QiLha
         qylsVkK6meH7v3BIAShlOo9Hccx/ehTtcxub5UUjRvpHxva4DCYr+kGPDa6msXrwcHyM
         eOjzT9czeBfbqzRMMFFQ7hm+CZnZjZK9sTxyYMMHaEHAq8KyFg56IvbIMfbUCyWINkJb
         sUS8sryDLWdEl7p36kuZ6Q9RxKT3+iyX+qnOYKA7E328JexmAB6BD2ItqJ/DGUm7WeH5
         0IAg==
X-Gm-Message-State: AOAM530cMJVSZRc07mRPng91vfEVNLoLqSLdpvF6CYQNnXP//vclg/SE
	RKNq2dASvGxfDm0GGQbv/s77zoUlIc5hVOKzXWbY0pM7cUOuOg==
X-Google-Smtp-Source: ABdhPJwd/cXF1FYCn4uBXEoKzWJEW7zOYp0xPm9dBf7esiTIAbLX/S1JQbNXEOKZTLw2KpUt/9Y2rseJXC6ONIRVrSM=
X-Received: by 2002:aca:fd0d:: with SMTP id b13mr17594080oii.27.1607944507738;
 Mon, 14 Dec 2020 03:15:07 -0800 (PST)
MIME-Version: 1.0
References: <20201212203707.7428-1-pbarker@konsulko.com> <20201212203707.7428-2-pbarker@konsulko.com>
 <20201214093005.pfo7exhdx36sgoyi@qschulz>
In-Reply-To: <20201214093005.pfo7exhdx36sgoyi@qschulz>
From: "Paul Barker" <pbarker@konsulko.com>
Date: Mon, 14 Dec 2020 11:14:57 +0000
Message-ID: <CAM9ZRVu4D9ba2zFHgogBS7MkOhR2CxRn2ORCDTbd7rNcw9+2aw@mail.gmail.com>
Subject: Re: [docs] [PATCH 2/4] documentation: Simplify layerindex and layer links
To: Quentin Schulz <quentin.schulz@streamunlimited.com>
Cc: YP docs mailing list <docs@lists.yoctoproject.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 14 Dec 2020 at 09:30, Quentin Schulz
<quentin.schulz@streamunlimited.com> wrote:
>
> Hi Paul,
>
> On Sat, Dec 12, 2020 at 08:37:05PM +0000, Paul Barker wrote:
> > Signed-off-by: Paul Barker <pbarker@konsulko.com>
> > ---
> >  documentation/conf.py                             |  2 ++
> >  documentation/dev-manual/common-tasks.rst         |  9 ++++-----
> >  documentation/overview-manual/concepts.rst        | 15 ++++++---------
> >  documentation/overview-manual/yp-intro.rst        |  6 ++----
> >  documentation/ref-manual/migration-2.3.rst        |  2 +-
> >  documentation/toaster-manual/intro.rst            |  2 +-
> >  documentation/toaster-manual/reference.rst        |  4 ++--
> >  documentation/toaster-manual/setup-and-use.rst    | 11 +++++------
> >  .../transitioning-to-a-custom-environment.rst     |  4 ++--
> >  documentation/what-i-wish-id-known.rst            | 11 +++++------
> >  10 files changed, 30 insertions(+), 36 deletions(-)
> >
> > diff --git a/documentation/conf.py b/documentation/conf.py
> > index b5351599d..57b9b6fd6 100644
> > --- a/documentation/conf.py
> > +++ b/documentation/conf.py
> > @@ -80,6 +80,8 @@ extlinks =3D {
> >      'oe_lists': ('https://lists.openembedded.org%s', None),
> >      'oe_git': ('https://git.openembedded.org%s', None),
> >      'oe_wiki': ('https://www.openembedded.org/wiki%s', None),
> > +    'oe_layerindex': ('https://layers.openembedded.org%s', None),
> > +    'oe_layer': ('https://layers.openembedded.org/layerindex/branch/ma=
ster/layer/%s/', None),
>
> 'oe_layer': ('https://layers.openembedded.org/layerindex/branch/master/la=
yer%s', None),
>
> To stay consistent with the rest? (Ultimately, we'll add the trailing
> slash, but probably all at once).

I don't really like the way that would look in the text, e.g:

    :oe_layer:`meta-poky </meta-poky/>`

I suppose it would be ok though.

>
> Ah.... now that I tested it, for some reason:
> https://layers.openembedded.org/layerindex/branch/master/layer/meta-raspb=
errypi/
> works but not:
> https://layers.openembedded.org/layerindex/branch/master/layer/meta-raspb=
errypi
>
> I'd maybe contact Michael about this?

This did surprise me. I'll send an email.

>
> >  }
> >
> >  # Intersphinx config to use cross reference with Bitbake user manual
> > diff --git a/documentation/dev-manual/common-tasks.rst b/documentation/=
dev-manual/common-tasks.rst
> > index 39db6563c..79acb8671 100644
> > --- a/documentation/dev-manual/common-tasks.rst
> > +++ b/documentation/dev-manual/common-tasks.rst
> > @@ -38,9 +38,8 @@ Follow these general steps to create your layer witho=
ut using tools:
> >
> >  1. *Check Existing Layers:* Before creating a new layer, you should be
> >     sure someone has not already created a layer containing the Metadat=
a
> > -   you need. You can see the `OpenEmbedded Metadata
> > -   Index <https://layers.openembedded.org/layerindex/layers/>`__ for a
> > -   list of layers from the OpenEmbedded community that can be used in
> > +   you need. You can see the :oe_layerindex:`OpenEmbedded Metadata Ind=
ex <>`
>
> This isn't great as you rely on the default tab of
> https://layers.openembedded.org to be layers', but that can change in
> the future.

So should we have:

    :oe_layerindex:`OpenEmbedded Metadata Index </layerindex/layers/>`

It seems redundant but as you say it would protect against changes to
the layerindex default tab. Are there any such changes planned or is
this just hypothetical?

>
> What about :oe_layer:`<>`? The resulting URL isn't great for now because
> of the slashes around %s but that's the best I can suggest right now.

I don't like this as we're not talking about a specific layer here.

>
> > +   for a list of layers from the OpenEmbedded community that can be us=
ed in
> >     the Yocto Project. You could find a layer that is identical or clos=
e
> >     to what you need.
> >
> > @@ -1194,8 +1193,8 @@ Before writing a recipe from scratch, it is often=
 useful to discover
> >  whether someone else has already written one that meets (or comes clos=
e
> >  to meeting) your needs. The Yocto Project and OpenEmbedded communities
> >  maintain many recipes that might be candidates for what you are doing.
> > -You can find a good central index of these recipes in the `OpenEmbedde=
d
> > -Layer Index <https://layers.openembedded.org>`__.
> > +You can find a good central index of these recipes in the
> > +:oe_layerindex:`OpenEmbedded Layer Index <>`.
> >
> >  Working from an existing recipe or a skeleton recipe is the best way t=
o
> >  get started. Here are some points on both methods:
> > diff --git a/documentation/overview-manual/concepts.rst b/documentation=
/overview-manual/concepts.rst
> > index 8fbbabbac..b51f2a6d1 100644
> > --- a/documentation/overview-manual/concepts.rst
> > +++ b/documentation/overview-manual/concepts.rst
> > @@ -144,8 +144,7 @@ several pieces of hardware.
> >  Many layers exist that work in the Yocto Project development
> >  environment. The `Yocto Project Curated Layer
> >  Index <https://www.yoctoproject.org/software-overview/layers/>`__
> > -and `OpenEmbedded Layer
> > -Index <http://layers.openembedded.org/layerindex/branch/master/layers/=
>`__
> > +and :oe_layerindex:`OpenEmbedded Layer Index <>`
>
> Ditto.
>
> >  both contain layers from which you can use or leverage.
> >
> >  By convention, layers in the Yocto Project follow a specific form.
> > @@ -380,13 +379,11 @@ figure <#general-workflow-figure>`__:
> >
> >  -  *Metadata (.bb + Patches):* Software layers containing
> >     user-supplied recipe files, patches, and append files. A good examp=
le
> > -   of a software layer might be the
> > -   `meta-qt5 layer <https://github.com/meta-qt5/meta-qt5>`__ from
> > -   the `OpenEmbedded Layer
> > -   Index <http://layers.openembedded.org/layerindex/branch/master/laye=
rs/>`__.
> > -   This layer is for version 5.0 of the popular
> > -   `Qt <https://wiki.qt.io/About_Qt>`__ cross-platform application
> > -   development framework for desktop, embedded and mobile.
> > +   of a software layer might be the :oe_layer:`meta-qt5 layer <meta-qt=
5>`
> > +   from the :oe_layerindex:`OpenEmbedded Layer Index <>`. This layer i=
s for
>
> Ditto.
>
> > +   version 5.0 of the popular `Qt <https://wiki.qt.io/About_Qt>`__
> > +   cross-platform application development framework for desktop, embed=
ded and
> > +   mobile.
> >
> >  -  *Machine BSP Configuration:* Board Support Package (BSP) layers (i.=
e.
> >     "BSP Layer" in the following figure) providing machine-specific
> > diff --git a/documentation/overview-manual/yp-intro.rst b/documentation=
/overview-manual/yp-intro.rst
> > index 456bfc549..4da55a83d 100644
> > --- a/documentation/overview-manual/yp-intro.rst
> > +++ b/documentation/overview-manual/yp-intro.rst
> > @@ -221,8 +221,7 @@ your Metadata, the easier it is to cope with future=
 changes.
> >
> >     -  Familiarize yourself with the `Yocto Project curated layer
> >        index <https://www.yoctoproject.org/software-overview/layers/>`_=
_
> > -      or the `OpenEmbedded layer
> > -      index <http://layers.openembedded.org/layerindex/branch/master/l=
ayers/>`__.
> > +      or the :oe_layerindex:`OpenEmbedded layer index <>`.
>
> Ditto.
>
> >        The latter contains more layers but they are less universally
> >        validated.
> >
> > @@ -364,8 +363,7 @@ activities using the Yocto Project:
> >     versions available for Yocto Project. The main purpose of the syste=
m
> >     is to help you manage the recipes you maintain and to offer a dynam=
ic
> >     overview of the project. The Recipe Reporting System is built on to=
p
> > -   of the `OpenEmbedded Layer
> > -   Index <http://layers.openembedded.org/layerindex/layers/>`__, which
> > +   of the :oe_layerindex:`OpenEmbedded Layer Index <>`, which
>
> Ditto.
>
> >     is a website that indexes OpenEmbedded-Core layers.
> >
> >  -  *Patchwork:* `Patchwork <http://jk.ozlabs.org/projects/patchwork/>`=
__
> > diff --git a/documentation/ref-manual/migration-2.3.rst b/documentation=
/ref-manual/migration-2.3.rst
> > index 3e9758119..ef03ab125 100644
> > --- a/documentation/ref-manual/migration-2.3.rst
> > +++ b/documentation/ref-manual/migration-2.3.rst
> > @@ -238,7 +238,7 @@ to substitute a GPLv2 version of a GPLv3 recipe, th=
en you must add the
> >  .. note::
> >
> >     You can ``find meta-gplv2`` layer in the OpenEmbedded layer index a=
t
> > -   https://layers.openembedded.org/layerindex/branch/master/layer/meta=
-gplv2/.
> > +   :oe_layer:`meta-gplv2`.
> >
>
> Should we fix the branch to "pyro" instead of master if ever the
> meta-gplv2 layer disappears in more recent versions of Yocto (it's a
> migration doc for 2.3).

The master branch should never be deleted, it should just stop being
updated at some point.

>
> >  These relocated GPLv2 recipes do not receive the same level of
> >  maintenance as other core recipes. The recipes do not get security fix=
es
> > diff --git a/documentation/toaster-manual/intro.rst b/documentation/toa=
ster-manual/intro.rst
> > index c78b3f53d..57e5b2bb7 100644
> > --- a/documentation/toaster-manual/intro.rst
> > +++ b/documentation/toaster-manual/intro.rst
> > @@ -27,7 +27,7 @@ extensive information about the build process.
> >     -  Browse layers listed in the various
> >        :ref:`layer sources <toaster-manual/reference:layer source>`
> >        that are available in your project (e.g. the OpenEmbedded Layer =
Index at
> > -      http://layers.openembedded.org/layerindex/).
> > +      :oe_layerindex:`/`).
> >
> >     -  Browse images, recipes, and machines provided by those layers.
> >
> > diff --git a/documentation/toaster-manual/reference.rst b/documentation=
/toaster-manual/reference.rst
> > index dfe51889e..34a1f39cf 100644
> > --- a/documentation/toaster-manual/reference.rst
> > +++ b/documentation/toaster-manual/reference.rst
> > @@ -24,7 +24,7 @@ type of layer source called a "layer index."
> >  A layer index is a web application that contains information about a s=
et
> >  of custom layers. A good example of an existing layer index is the
> >  OpenEmbedded Layer Index. A public instance of this layer index exists
> > -at http://layers.openembedded.org. You can find the code for this
> > +at :oe_layerindex:`/`. You can find the code for this
> >  layer index's web application at :yocto_git:`/layerindex-web/`.
> >
> >  When you tie a layer source into Toaster, it can query the layer sourc=
e
> > @@ -81,7 +81,7 @@ describes two methods by which you can configure and =
use your layer
> >  index.
> >
> >  In the previous section, the code for the OpenEmbedded Metadata Index
> > -(i.e. http://layers.openembedded.org) was referenced. You can use
> > +(i.e. :oe_layerindex:`/`) was referenced. You can use
> >  this code, which is at :yocto_git:`/layerindex-web/`, as a base to cre=
ate
> >  your own layer index.
> >
> > diff --git a/documentation/toaster-manual/setup-and-use.rst b/documenta=
tion/toaster-manual/setup-and-use.rst
> > index 2cb7884eb..9e7b0737c 100644
> > --- a/documentation/toaster-manual/setup-and-use.rst
> > +++ b/documentation/toaster-manual/setup-and-use.rst
> > @@ -462,9 +462,8 @@ Using the Toaster Web Interface
> >
> >  The Toaster web interface allows you to do the following:
> >
> > --  Browse published layers in the `OpenEmbedded Layer
> > -   Index <http://layers.openembedded.org>`__ that are available for yo=
ur
> > -   selected version of the build system.
> > +-  Browse published layers in the :oe_layerindex:`OpenEmbedded Layer I=
ndex <>`
> > +   that are available for your selected version of the build system.
> >
> >  -  Import your own layers for building.
> >
> > @@ -573,11 +572,11 @@ However, the "Local Yocto Project" release will n=
ot provide you with any
> >  compatible layers, other than the three core layers that come with the
> >  Yocto Project:
> >
> > --  `openembedded-core <http://layers.openembedded.org/layerindex/branc=
h/master/layer/openembedded-core/>`__
> > +-  :oe_layer:`openembedded-core <openembedded-core>`
> >
> > --  `meta-poky <http://layers.openembedded.org/layerindex/branch/master=
/layer/meta-poky/>`__
> > +-  :oe_layer:`meta-poky <meta-poky>`
> >
> > --  `meta-yocto-bsp <http://layers.openembedded.org/layerindex/branch/m=
aster/layer/meta-yocto-bsp/>`__
> > +-  :oe_layer:`meta-yocto-bsp <meta-yocto-bsp>`
> >
> >  .. image:: figures/compatible-layers.png
> >     :align: center
> > diff --git a/documentation/transitioning-to-a-custom-environment.rst b/=
documentation/transitioning-to-a-custom-environment.rst
> > index 415f295b3..abbd74ca1 100644
> > --- a/documentation/transitioning-to-a-custom-environment.rst
> > +++ b/documentation/transitioning-to-a-custom-environment.rst
> > @@ -29,8 +29,8 @@ Transitioning to a custom environment for systems dev=
elopment
> >
> >  #. **Find and acquire the best BSP for your target**.
> >     Use the :yocto_home:`Yocto Project curated layer index
> > -   </software-overview/layers/>` or even the `OpenEmbedded layer index
> > -   <https://layers.openembedded.org>`_ to find and acquire the best BS=
P for your
> > +   </software-overview/layers/>` or even the :oe_layerindex:`OpenEmbed=
ded
> > +   layer index <>` to find and acquire the best BSP for your
> >     target board. The Yocto Project layer index BSPs are regularly vali=
dated. The
> >     best place to get your first BSP is from your silicon manufacturer =
or board
> >     vendor =E2=80=93 they can point you to their most qualified efforts=
. In general, for
> > diff --git a/documentation/what-i-wish-id-known.rst b/documentation/wha=
t-i-wish-id-known.rst
> > index a051036bb..143f9fbfe 100644
> > --- a/documentation/what-i-wish-id-known.rst
> > +++ b/documentation/what-i-wish-id-known.rst
> > @@ -27,11 +27,10 @@ contact us with other suggestions.
> >     to be responsible for your own updates.
> >
> >  #. **Get to know the layer index:**
> > -   All layers can be found in the `layer index
> > -   <https://layers.openembedded.org/>`_. Layers which have applied for=
 Yocto
> > -   Project Compatible status (structure continuity assurance and testi=
ng) can be
> > -   found in the :yocto_home:`Yocto Project Compatible index
> > -   </software-over/layer/>`.  Generally check the Compatible layer ind=
ex first,
> > +   All layers can be found in the :oe_layerindex:`layer index <>`. Lay=
ers which
>
> :oe_layer:`<>` here as we specifically target layers metadata index?
> Thanks,
> Quentin

Thanks,

--=20
Paul Barker
Konsulko Group
