Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
 by mx.groups.io with SMTP id smtpd.web10.12372.1608648364314414851
 for <docs@lists.yoctoproject.org>;
 Tue, 22 Dec 2020 06:46:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=f2THgNyQ;
 spf=pass (domain: linaro.org, ip: 209.85.208.51, mailfrom: nicolas.dechesne@linaro.org)
Received: by mail-ed1-f51.google.com with SMTP id c7so13129640edv.6
        for <docs@lists.yoctoproject.org>; Tue, 22 Dec 2020 06:46:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=/Q8uNm9MjoBxOvGCNnY0h1BFjMrcnPeihADF+Djqulg=;
        b=f2THgNyQxiQQgM8ELCfNeYahGReJKP65RMl2LAYUnnFa1v4AB9kDIU9p5hHHmM20jB
         WNu1faKcl7NHyCiLJjjyy11jc+vZV9JGoaLSXdaR9YetOx8sfGSyEhKQb+lPG0lZmrjz
         JjGL+GdYWNzkiq9ep6g3580cYIzUHjmoQ26R5KLZaSwUuLcR12+kRKYzXVBg4neiDN9C
         QcPzNKzLnRqyMT8JJR9qgRpYVBf7iCD2OUWxd8fr9fMDGAzHV39XnDr/sixnbYKC7nLW
         7ZILKIN3gtq5/wMMRJQfVMpJIRGfwhtAScUEyYYIb3QMhRjbcrGbeUOgclBa3DENig4D
         Rwiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=/Q8uNm9MjoBxOvGCNnY0h1BFjMrcnPeihADF+Djqulg=;
        b=kt4uIbgQUFqm6d0V2FUUYM1I6CzDB0SjxQatOY86GzlNcWaJ8DPuutyA5+/9duzp1m
         FmGVoBsh6yRehH/kYGl7EcmS0TpeLKIH/Qai9kz1UxyxD9aqmHFdDGMEhiS0yyo6whUj
         VNjpEuiTSXdGHELciCARBC1wFjnI4ecnz0ebfHcJsa7P/F1snmsVlndhjsLB2Z3JeTTI
         PcUvHWB3qJzwvapEIVB1eSgec5BRj74H8Hq/v1b7Sc74gvadQjtkDwxsN0ir0d1eJsDS
         Spwiy8D8f4Vunm37aSSck0nDf5rW/Q+yb/AfZkzxu1iObXDnXmpQn9vjByUyl1nchU4d
         sdFw==
X-Gm-Message-State: AOAM532paxfpHduBTTT4Wukcvqy9d3oCvHRPnlRkjDYKC2fjZYFK7pGr
	nZfPbfOXzTOTq8fBNcn0ztawfzPfKAXmN5++nASL1w==
X-Google-Smtp-Source: ABdhPJy1Ru7EeNVzRGuoCy1NkdN1/rJrmizQ4NuR4OgYGdQTeIOmHH7E7esTNMeX2/VJmsFPwYYCQBBuNvkpvjGMOrk=
X-Received: by 2002:a05:6402:379:: with SMTP id s25mr21272131edw.367.1608648362532;
 Tue, 22 Dec 2020 06:46:02 -0800 (PST)
MIME-Version: 1.0
References: <20201222095758.7411-1-pbarker@konsulko.com> <20201222095758.7411-3-pbarker@konsulko.com>
 <20201222141900.ug5bazv7e4jjl3h5@qschulz>
In-Reply-To: <20201222141900.ug5bazv7e4jjl3h5@qschulz>
From: "Nicolas Dechesne" <nicolas.dechesne@linaro.org>
Date: Tue, 22 Dec 2020 15:45:51 +0100
Message-ID: <CAP71WjxyC+zsGaewQb1BqezPRAnwm+dP6Vvz9qk3zogL8ZBdcw@mail.gmail.com>
Subject: Re: [docs] [PATCH v2 2/6] documentation: Simplify layerindex and layer links
To: Quentin Schulz <quentin.schulz@streamunlimited.com>
Cc: Paul Barker <pbarker@konsulko.com>, 
	YP docs mailing list <docs@lists.yoctoproject.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 22, 2020 at 3:19 PM Quentin Schulz
<quentin.schulz@streamunlimited.com> wrote:
>
> Hi Paul,
>
> On Tue, Dec 22, 2020 at 09:57:54AM +0000, Paul Barker wrote:
> > Signed-off-by: Paul Barker <pbarker@konsulko.com>
> > ---
> >  documentation/conf.py                             |  2 ++
> >  documentation/dev-manual/common-tasks.rst         |  9 ++++-----
> >  documentation/overview-manual/concepts.rst        | 15 ++++++--------=
-
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
> > index b5351599d..68eb92b0a 100644
> > --- a/documentation/conf.py
> > +++ b/documentation/conf.py
> > @@ -80,6 +80,8 @@ extlinks =3D {
> >      'oe_lists': ('https://lists.openembedded.org%s', None),
> >      'oe_git': ('https://git.openembedded.org%s', None),
> >      'oe_wiki': ('https://www.openembedded.org/wiki%s', None),
> > +    'oe_layerindex': ('https://layers.openembedded.org%s', None),
> > +    'oe_layer': ('https://layers.openembedded.org/layerindex/branch/m=
aster/layer%s', None),
>
> I've contacted Michael Halstead about the issue we were talking about in
> the v1. He's managed to redirect
> https://layers.openembedded.org/layerindex/branch/master/layer/meta-xxx
> to
> https://layers.openembedded.org/layerindex/branch/master/layer/meta-xxx/
>
> therefore we can have consistency in our docs and have only the leading
> slash.

that's pretty cool. Thanks Quentin and Michael for this change!

>
> Please change your:
> :oe_layer:`/meta-xxx/` into :oe_layer:`/meta-xxx`
>
> >  }
> >
> >  # Intersphinx config to use cross reference with Bitbake user manual
> > diff --git a/documentation/dev-manual/common-tasks.rst b/documentation=
/dev-manual/common-tasks.rst
> > index 39db6563c..b2f433e1d 100644
> > --- a/documentation/dev-manual/common-tasks.rst
> > +++ b/documentation/dev-manual/common-tasks.rst
> > @@ -38,9 +38,8 @@ Follow these general steps to create your layer with=
out using tools:
> >
> >  1. *Check Existing Layers:* Before creating a new layer, you should b=
e
> >     sure someone has not already created a layer containing the Metada=
ta
> > -   you need. You can see the `OpenEmbedded Metadata
> > -   Index <https://layers.openembedded.org/layerindex/layers/>`__ for =
a
> > -   list of layers from the OpenEmbedded community that can be used in
> > +   you need. You can see the :oe_layer:`OpenEmbedded Metadata Index <=
>`
>
> I'm pretty sure it's me who suggested this so my bad, this does not work
> unfortunately :/
>
> :oe_layer:`<>` results in https://layers.openembedded.org/layerindex/bra=
nch/master/layer/
> but it's actually:
> https://layers.openembedded.org/layerindex/branch/master/layers/ we want
> (note the additional `s`).
>
> What about:
> 'oe_metadataindex': ('https://layers.openembedded.org%s', None),
> 'oe_layer': ('https://layers.openembedded.org/layerindex/branch/master/l=
ayer%s', None),
>
> and have in poky.yaml:
> OE_LAYERINDEX : "https://layers.openembedded.org/layerindex/layers/"
> ?

I am not sure I like this idea, it duplicates the link in conf.py and
poky.yaml for not much benefit.

>
> replacing :oe_layer:`<>` with &OE_LAYERINDEX; and :oe_layerindex:
> with :oe_metadataindex: (if it is appropriate).
>
> or
> 'oe_metadataindex': ('https://layers.openembedded.org/layerindex%s', Non=
e),
> 'oe_layer': ('https://layers.openembedded.org/layerindex/branch/master/l=
ayer%s', None),
>
> replacing :oe_layer:`<>` with :oe_metadataindex:`/layers` (note at the
> time of writing, this isn't working yet but I've asked Michael about it
> already).
>
> TL;DR: if we want to merge this ASAP, we'd probably want the
> :oe_layer:`/meta-xxx/` into :oe_layer:`/meta-xxx` and
> :oe_layer:`<>` into :oe_layerindex:`/layerindex/branch/master/layers` ch=
anges
> and we can make the latter change neater in a followup patch.

I agree. let's do that for now. I think we haven't still figured out
the best way to use extlinks for the layer index links.. but we should
unblock these patches, and deal with that separately.

It would be interesting to explore (in a different patch series) using thi=
s:
'oe_layer': ('https://layers.openembedded.org/layerindex/branch/master/%s'=
,
None),

so that any of the following should work:
:oe_layer:`layers`
:oe_layer:`layer/meta-foo`
:oe_layer:`recipes`
:oe_layer:`recipe/xxx`


>
> > +   for a list of layers from the OpenEmbedded community that can be u=
sed in
> >     the Yocto Project. You could find a layer that is identical or clo=
se
> >     to what you need.
> >
> > @@ -1194,8 +1193,8 @@ Before writing a recipe from scratch, it is ofte=
n useful to discover
> >  whether someone else has already written one that meets (or comes clo=
se
> >  to meeting) your needs. The Yocto Project and OpenEmbedded communitie=
s
> >  maintain many recipes that might be candidates for what you are doing=
.
> > -You can find a good central index of these recipes in the `OpenEmbedd=
ed
> > -Layer Index <https://layers.openembedded.org>`__.
> > +You can find a good central index of these recipes in the
> > +:oe_layerindex:`OpenEmbedded Layer Index <>`.
> >
> >  Working from an existing recipe or a skeleton recipe is the best way =
to
> >  get started. Here are some points on both methods:
> > diff --git a/documentation/overview-manual/concepts.rst b/documentatio=
n/overview-manual/concepts.rst
> > index 8fbbabbac..98c7b4f6b 100644
> > --- a/documentation/overview-manual/concepts.rst
> > +++ b/documentation/overview-manual/concepts.rst
> > @@ -144,8 +144,7 @@ several pieces of hardware.
> >  Many layers exist that work in the Yocto Project development
> >  environment. The `Yocto Project Curated Layer
> >  Index <https://www.yoctoproject.org/software-overview/layers/>`__
> > -and `OpenEmbedded Layer
> > -Index <http://layers.openembedded.org/layerindex/branch/master/layers=
/>`__
> > +and :oe_layer:`OpenEmbedded Layer Index <>`
> >  both contain layers from which you can use or leverage.
> >
> >  By convention, layers in the Yocto Project follow a specific form.
> > @@ -380,13 +379,11 @@ figure <#general-workflow-figure>`__:
> >
> >  -  *Metadata (.bb + Patches):* Software layers containing
> >     user-supplied recipe files, patches, and append files. A good exam=
ple
> > -   of a software layer might be the
> > -   `meta-qt5 layer <https://github.com/meta-qt5/meta-qt5>`__ from
> > -   the `OpenEmbedded Layer
> > -   Index <http://layers.openembedded.org/layerindex/branch/master/lay=
ers/>`__.
> > -   This layer is for version 5.0 of the popular
> > -   `Qt <https://wiki.qt.io/About_Qt>`__ cross-platform application
> > -   development framework for desktop, embedded and mobile.
> > +   of a software layer might be the :oe_layer:`meta-qt5 layer </meta-=
qt5/>`
> > +   from the :oe_layerindex:`OpenEmbedded Layer Index <>`. This layer =
is for
>
> The outcome of :oe_layerindex:`OpenEmbedded Layer Index <>` is different
> from http://layers.openembedded.org/layerindex/branch/master/layers/.
>
> You probably wanted :oe_layer: here (though, it does not work, sadly).
>
> > +   version 5.0 of the popular `Qt <https://wiki.qt.io/About_Qt>`__
> > +   cross-platform application development framework for desktop, embe=
dded and
> > +   mobile.
> >
> >  -  *Machine BSP Configuration:* Board Support Package (BSP) layers (i=
.e.
> >     "BSP Layer" in the following figure) providing machine-specific
> > diff --git a/documentation/overview-manual/yp-intro.rst b/documentatio=
n/overview-manual/yp-intro.rst
> > index 456bfc549..980bfe5c2 100644
> > --- a/documentation/overview-manual/yp-intro.rst
> > +++ b/documentation/overview-manual/yp-intro.rst
> > @@ -221,8 +221,7 @@ your Metadata, the easier it is to cope with futur=
e changes.
> >
> >     -  Familiarize yourself with the `Yocto Project curated layer
> >        index <https://www.yoctoproject.org/software-overview/layers/>`=
__
> > -      or the `OpenEmbedded layer
> > -      index <http://layers.openembedded.org/layerindex/branch/master/=
layers/>`__.
> > +      or the :oe_layer:`OpenEmbedded layer index <>`.
> >        The latter contains more layers but they are less universally
> >        validated.
> >
> > @@ -364,8 +363,7 @@ activities using the Yocto Project:
> >     versions available for Yocto Project. The main purpose of the syst=
em
> >     is to help you manage the recipes you maintain and to offer a dyna=
mic
> >     overview of the project. The Recipe Reporting System is built on t=
op
> > -   of the `OpenEmbedded Layer
> > -   Index <http://layers.openembedded.org/layerindex/layers/>`__, whic=
h
> > +   of the :oe_layerindex:`OpenEmbedded Layer Index <>`, which
>
> Ditto.
>
> >     is a website that indexes OpenEmbedded-Core layers.
> >
> >  -  *Patchwork:* `Patchwork <http://jk.ozlabs.org/projects/patchwork/>=
`__
> > diff --git a/documentation/ref-manual/migration-2.3.rst b/documentatio=
n/ref-manual/migration-2.3.rst
> > index 3e9758119..57ff011e7 100644
> > --- a/documentation/ref-manual/migration-2.3.rst
> > +++ b/documentation/ref-manual/migration-2.3.rst
> > @@ -238,7 +238,7 @@ to substitute a GPLv2 version of a GPLv3 recipe, t=
hen you must add the
> >  .. note::
> >
> >     You can ``find meta-gplv2`` layer in the OpenEmbedded layer index =
at
> > -   https://layers.openembedded.org/layerindex/branch/master/layer/met=
a-gplv2/.
> > +   :oe_layer:`/meta-gplv2/`.
> >
> >  These relocated GPLv2 recipes do not receive the same level of
> >  maintenance as other core recipes. The recipes do not get security fi=
xes
> > diff --git a/documentation/toaster-manual/intro.rst b/documentation/to=
aster-manual/intro.rst
> > index c78b3f53d..57e5b2bb7 100644
> > --- a/documentation/toaster-manual/intro.rst
> > +++ b/documentation/toaster-manual/intro.rst
> > @@ -27,7 +27,7 @@ extensive information about the build process.
> >     -  Browse layers listed in the various
> >        :ref:`layer sources <toaster-manual/reference:layer source>`
> >        that are available in your project (e.g. the OpenEmbedded Layer=
 Index at
> > -      http://layers.openembedded.org/layerindex/).
> > +      :oe_layerindex:`/`).
>
> Probably wanted :oe_layer:`/` here since we're aiming at giving the link
> to the Layer tab (though, yes, by default it redirects to the layer tab,=
 and
> yes, it does not work currently :)).
>
> >
> >     -  Browse images, recipes, and machines provided by those layers.
> >
> > diff --git a/documentation/toaster-manual/reference.rst b/documentatio=
n/toaster-manual/reference.rst
> > index dfe51889e..34a1f39cf 100644
> > --- a/documentation/toaster-manual/reference.rst
> > +++ b/documentation/toaster-manual/reference.rst
> > @@ -24,7 +24,7 @@ type of layer source called a "layer index."
> >  A layer index is a web application that contains information about a =
set
> >  of custom layers. A good example of an existing layer index is the
> >  OpenEmbedded Layer Index. A public instance of this layer index exist=
s
> > -at http://layers.openembedded.org. You can find the code for this
> > +at :oe_layerindex:`/`. You can find the code for this
>
> Ditto.
>
> >  layer index's web application at :yocto_git:`/layerindex-web/`.
> >
> >  When you tie a layer source into Toaster, it can query the layer sour=
ce
> > @@ -81,7 +81,7 @@ describes two methods by which you can configure and=
 use your layer
> >  index.
> >
> >  In the previous section, the code for the OpenEmbedded Metadata Index
> > -(i.e. http://layers.openembedded.org) was referenced. You can use
> > +(i.e. :oe_layerindex:`/`) was referenced. You can use
> >  this code, which is at :yocto_git:`/layerindex-web/`, as a base to cr=
eate
> >  your own layer index.
> >
> > diff --git a/documentation/toaster-manual/setup-and-use.rst b/document=
ation/toaster-manual/setup-and-use.rst
> > index 2cb7884eb..a3225da91 100644
> > --- a/documentation/toaster-manual/setup-and-use.rst
> > +++ b/documentation/toaster-manual/setup-and-use.rst
> > @@ -462,9 +462,8 @@ Using the Toaster Web Interface
> >
> >  The Toaster web interface allows you to do the following:
> >
> > --  Browse published layers in the `OpenEmbedded Layer
> > -   Index <http://layers.openembedded.org>`__ that are available for y=
our
> > -   selected version of the build system.
> > +-  Browse published layers in the :oe_layer:`OpenEmbedded Layer Index=
 <>`
>
> Ditto.
>
> > +   that are available for your selected version of the build system.
> >
> >  -  Import your own layers for building.
> >
> > @@ -573,11 +572,11 @@ However, the "Local Yocto Project" release will =
not provide you with any
> >  compatible layers, other than the three core layers that come with th=
e
> >  Yocto Project:
> >
> > --  `openembedded-core <http://layers.openembedded.org/layerindex/bran=
ch/master/layer/openembedded-core/>`__
> > +-  :oe_layer:`openembedded-core </openembedded-core/>`
> >
> > --  `meta-poky <http://layers.openembedded.org/layerindex/branch/maste=
r/layer/meta-poky/>`__
> > +-  :oe_layer:`meta-poky </meta-poky/>`
> >
> > --  `meta-yocto-bsp <http://layers.openembedded.org/layerindex/branch/=
master/layer/meta-yocto-bsp/>`__
> > +-  :oe_layer:`meta-yocto-bsp </meta-yocto-bsp/>`
> >
> >  .. image:: figures/compatible-layers.png
> >     :align: center
> > diff --git a/documentation/transitioning-to-a-custom-environment.rst b=
/documentation/transitioning-to-a-custom-environment.rst
> > index 415f295b3..76a3215de 100644
> > --- a/documentation/transitioning-to-a-custom-environment.rst
> > +++ b/documentation/transitioning-to-a-custom-environment.rst
> > @@ -29,8 +29,8 @@ Transitioning to a custom environment for systems de=
velopment
> >
> >  #. **Find and acquire the best BSP for your target**.
> >     Use the :yocto_home:`Yocto Project curated layer index
> > -   </software-overview/layers/>` or even the `OpenEmbedded layer inde=
x
> > -   <https://layers.openembedded.org>`_ to find and acquire the best B=
SP for your
> > +   </software-overview/layers/>` or even the :oe_layer:`OpenEmbedded
> > +   layer index <>` to find and acquire the best BSP for your
>
> Ditto.
>
> >     target board. The Yocto Project layer index BSPs are regularly val=
idated. The
> >     best place to get your first BSP is from your silicon manufacturer=
 or board
> >     vendor =E2=80=93 they can point you to their most qualified effort=
s. In general, for
> > diff --git a/documentation/what-i-wish-id-known.rst b/documentation/wh=
at-i-wish-id-known.rst
> > index a051036bb..a52a16656 100644
> > --- a/documentation/what-i-wish-id-known.rst
> > +++ b/documentation/what-i-wish-id-known.rst
> > @@ -27,11 +27,10 @@ contact us with other suggestions.
> >     to be responsible for your own updates.
> >
> >  #. **Get to know the layer index:**
> > -   All layers can be found in the `layer index
> > -   <https://layers.openembedded.org/>`_. Layers which have applied fo=
r Yocto
> > -   Project Compatible status (structure continuity assurance and test=
ing) can be
> > -   found in the :yocto_home:`Yocto Project Compatible index
> > -   </software-over/layer/>`.  Generally check the Compatible layer in=
dex first,
> > +   All layers can be found in the :oe_layer:`layer index <>`. Layers =
which
> > +   have applied for Yocto Project Compatible status (structure contin=
uity
> > +   assurance and testing) can be found in the :yocto_home:`Yocto Proj=
ect Compatible index
> > +   </software-over/layer/>`. Generally check the Compatible layer ind=
ex first,
> >     and if you don't find the necessary layer check the general layer =
index. The
> >     layer index is an original artifact from the Open Embedded Project=
. As such,
> >     that index doesn't have the curating and testing that the Yocto Pr=
oject
> > @@ -172,7 +171,7 @@ contact us with other suggestions.
> >     * add an ssh server to an image (enable transferring of files to t=
arget)
> >     * know the anatomy of a recipe
> >     * know how to create and use layers
> > -   * find recipes (with the `OpenEmbedded Layer index <https://layers=
.openembedded.org>`_)
> > +   * find recipes (with the :oe_layerindex:`OpenEmbedded Layer index =
<>`)
>
> If we went for the second suggested :oe_metadataindex:, we could use:
> :oe_metadataindex:`/recipes` here.
>
> Thanks,
> Quentin
>
>=20
>
