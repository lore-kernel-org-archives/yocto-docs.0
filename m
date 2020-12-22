Received: from bsmtp2.bon.at (bsmtp2.bon.at [213.33.87.16])
 by mx.groups.io with SMTP id smtpd.web08.11663.1608646744875031098
 for <docs@lists.yoctoproject.org>;
 Tue, 22 Dec 2020 06:19:05 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: streamunlimited.com, ip: 213.33.87.16, mailfrom: quentin.schulz@streamunlimited.com)
Received: from qschulz (vpn.streamunlimited.com [91.114.0.140])
	by bsmtp2.bon.at (Postfix) with ESMTPSA id 4D0dkG1bmnz5tl9;
	Tue, 22 Dec 2020 15:19:02 +0100 (CET)
Date: Tue, 22 Dec 2020 15:19:00 +0100
From: "Quentin Schulz" <quentin.schulz@streamunlimited.com>
To: Paul Barker <pbarker@konsulko.com>
Cc: docs@lists.yoctoproject.org
Subject: Re: [docs] [PATCH v2 2/6] documentation: Simplify layerindex and layer links
Message-ID: <20201222141900.ug5bazv7e4jjl3h5@qschulz>
References: <20201222095758.7411-1-pbarker@konsulko.com>
 <20201222095758.7411-3-pbarker@konsulko.com>
MIME-Version: 1.0
In-Reply-To: <20201222095758.7411-3-pbarker@konsulko.com>
User-Agent: NeoMutt/20180716
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Paul,

On Tue, Dec 22, 2020 at 09:57:54AM +0000, Paul Barker wrote:
> Signed-off-by: Paul Barker <pbarker@konsulko.com>
> ---
>  documentation/conf.py                             |  2 ++
>  documentation/dev-manual/common-tasks.rst         |  9 ++++-----
>  documentation/overview-manual/concepts.rst        | 15 ++++++---------
>  documentation/overview-manual/yp-intro.rst        |  6 ++----
>  documentation/ref-manual/migration-2.3.rst        |  2 +-
>  documentation/toaster-manual/intro.rst            |  2 +-
>  documentation/toaster-manual/reference.rst        |  4 ++--
>  documentation/toaster-manual/setup-and-use.rst    | 11 +++++------
>  .../transitioning-to-a-custom-environment.rst     |  4 ++--
>  documentation/what-i-wish-id-known.rst            | 11 +++++------
>  10 files changed, 30 insertions(+), 36 deletions(-)
>=20
> diff --git a/documentation/conf.py b/documentation/conf.py
> index b5351599d..68eb92b0a 100644
> --- a/documentation/conf.py
> +++ b/documentation/conf.py
> @@ -80,6 +80,8 @@ extlinks =3D {
>      'oe_lists': ('https://lists.openembedded.org%s', None),
>      'oe_git': ('https://git.openembedded.org%s', None),
>      'oe_wiki': ('https://www.openembedded.org/wiki%s', None),
> +    'oe_layerindex': ('https://layers.openembedded.org%s', None),
> +    'oe_layer': ('https://layers.openembedded.org/layerindex/branch/ma=
ster/layer%s', None),

I've contacted Michael Halstead about the issue we were talking about in
the v1. He's managed to redirect
https://layers.openembedded.org/layerindex/branch/master/layer/meta-xxx
to
https://layers.openembedded.org/layerindex/branch/master/layer/meta-xxx/

therefore we can have consistency in our docs and have only the leading
slash.

Please change your:
:oe_layer:`/meta-xxx/` into :oe_layer:`/meta-xxx`

>  }
> =20
>  # Intersphinx config to use cross reference with Bitbake user manual
> diff --git a/documentation/dev-manual/common-tasks.rst b/documentation/=
dev-manual/common-tasks.rst
> index 39db6563c..b2f433e1d 100644
> --- a/documentation/dev-manual/common-tasks.rst
> +++ b/documentation/dev-manual/common-tasks.rst
> @@ -38,9 +38,8 @@ Follow these general steps to create your layer witho=
ut using tools:
> =20
>  1. *Check Existing Layers:* Before creating a new layer, you should be
>     sure someone has not already created a layer containing the Metadat=
a
> -   you need. You can see the `OpenEmbedded Metadata
> -   Index <https://layers.openembedded.org/layerindex/layers/>`__ for a
> -   list of layers from the OpenEmbedded community that can be used in
> +   you need. You can see the :oe_layer:`OpenEmbedded Metadata Index <>=
`

I'm pretty sure it's me who suggested this so my bad, this does not work
unfortunately :/

:oe_layer:`<>` results in https://layers.openembedded.org/layerindex/bran=
ch/master/layer/
but it's actually:
https://layers.openembedded.org/layerindex/branch/master/layers/ we want
(note the additional `s`).

What about:
'oe_metadataindex': ('https://layers.openembedded.org%s', None),
'oe_layer': ('https://layers.openembedded.org/layerindex/branch/master/la=
yer%s', None),

and have in poky.yaml:
OE_LAYERINDEX : "https://layers.openembedded.org/layerindex/layers/"
?

replacing :oe_layer:`<>` with &OE_LAYERINDEX; and :oe_layerindex:
with :oe_metadataindex: (if it is appropriate).

or=20
'oe_metadataindex': ('https://layers.openembedded.org/layerindex%s', None=
),
'oe_layer': ('https://layers.openembedded.org/layerindex/branch/master/la=
yer%s', None),

replacing :oe_layer:`<>` with :oe_metadataindex:`/layers` (note at the
time of writing, this isn't working yet but I've asked Michael about it
already).

TL;DR: if we want to merge this ASAP, we'd probably want the
:oe_layer:`/meta-xxx/` into :oe_layer:`/meta-xxx` and
:oe_layer:`<>` into :oe_layerindex:`/layerindex/branch/master/layers` cha=
nges
and we can make the latter change neater in a followup patch.

> +   for a list of layers from the OpenEmbedded community that can be us=
ed in
>     the Yocto Project. You could find a layer that is identical or clos=
e
>     to what you need.
> =20
> @@ -1194,8 +1193,8 @@ Before writing a recipe from scratch, it is often=
 useful to discover
>  whether someone else has already written one that meets (or comes clos=
e
>  to meeting) your needs. The Yocto Project and OpenEmbedded communities
>  maintain many recipes that might be candidates for what you are doing.
> -You can find a good central index of these recipes in the `OpenEmbedde=
d
> -Layer Index <https://layers.openembedded.org>`__.
> +You can find a good central index of these recipes in the
> +:oe_layerindex:`OpenEmbedded Layer Index <>`.
> =20
>  Working from an existing recipe or a skeleton recipe is the best way t=
o
>  get started. Here are some points on both methods:
> diff --git a/documentation/overview-manual/concepts.rst b/documentation=
/overview-manual/concepts.rst
> index 8fbbabbac..98c7b4f6b 100644
> --- a/documentation/overview-manual/concepts.rst
> +++ b/documentation/overview-manual/concepts.rst
> @@ -144,8 +144,7 @@ several pieces of hardware.
>  Many layers exist that work in the Yocto Project development
>  environment. The `Yocto Project Curated Layer
>  Index <https://www.yoctoproject.org/software-overview/layers/>`__
> -and `OpenEmbedded Layer
> -Index <http://layers.openembedded.org/layerindex/branch/master/layers/=
>`__
> +and :oe_layer:`OpenEmbedded Layer Index <>`
>  both contain layers from which you can use or leverage.
> =20
>  By convention, layers in the Yocto Project follow a specific form.
> @@ -380,13 +379,11 @@ figure <#general-workflow-figure>`__:
> =20
>  -  *Metadata (.bb + Patches):* Software layers containing
>     user-supplied recipe files, patches, and append files. A good examp=
le
> -   of a software layer might be the
> -   `meta-qt5 layer <https://github.com/meta-qt5/meta-qt5>`__ from
> -   the `OpenEmbedded Layer
> -   Index <http://layers.openembedded.org/layerindex/branch/master/laye=
rs/>`__.
> -   This layer is for version 5.0 of the popular
> -   `Qt <https://wiki.qt.io/About_Qt>`__ cross-platform application
> -   development framework for desktop, embedded and mobile.
> +   of a software layer might be the :oe_layer:`meta-qt5 layer </meta-q=
t5/>`
> +   from the :oe_layerindex:`OpenEmbedded Layer Index <>`. This layer i=
s for

The outcome of :oe_layerindex:`OpenEmbedded Layer Index <>` is different
from http://layers.openembedded.org/layerindex/branch/master/layers/.

You probably wanted :oe_layer: here (though, it does not work, sadly).

> +   version 5.0 of the popular `Qt <https://wiki.qt.io/About_Qt>`__
> +   cross-platform application development framework for desktop, embed=
ded and
> +   mobile.
> =20
>  -  *Machine BSP Configuration:* Board Support Package (BSP) layers (i.=
e.
>     "BSP Layer" in the following figure) providing machine-specific
> diff --git a/documentation/overview-manual/yp-intro.rst b/documentation=
/overview-manual/yp-intro.rst
> index 456bfc549..980bfe5c2 100644
> --- a/documentation/overview-manual/yp-intro.rst
> +++ b/documentation/overview-manual/yp-intro.rst
> @@ -221,8 +221,7 @@ your Metadata, the easier it is to cope with future=
 changes.
> =20
>     -  Familiarize yourself with the `Yocto Project curated layer
>        index <https://www.yoctoproject.org/software-overview/layers/>`_=
_
> -      or the `OpenEmbedded layer
> -      index <http://layers.openembedded.org/layerindex/branch/master/l=
ayers/>`__.
> +      or the :oe_layer:`OpenEmbedded layer index <>`.
>        The latter contains more layers but they are less universally
>        validated.
> =20
> @@ -364,8 +363,7 @@ activities using the Yocto Project:
>     versions available for Yocto Project. The main purpose of the syste=
m
>     is to help you manage the recipes you maintain and to offer a dynam=
ic
>     overview of the project. The Recipe Reporting System is built on to=
p
> -   of the `OpenEmbedded Layer
> -   Index <http://layers.openembedded.org/layerindex/layers/>`__, which
> +   of the :oe_layerindex:`OpenEmbedded Layer Index <>`, which

Ditto.

>     is a website that indexes OpenEmbedded-Core layers.
> =20
>  -  *Patchwork:* `Patchwork <http://jk.ozlabs.org/projects/patchwork/>`=
__
> diff --git a/documentation/ref-manual/migration-2.3.rst b/documentation=
/ref-manual/migration-2.3.rst
> index 3e9758119..57ff011e7 100644
> --- a/documentation/ref-manual/migration-2.3.rst
> +++ b/documentation/ref-manual/migration-2.3.rst
> @@ -238,7 +238,7 @@ to substitute a GPLv2 version of a GPLv3 recipe, th=
en you must add the
>  .. note::
> =20
>     You can ``find meta-gplv2`` layer in the OpenEmbedded layer index a=
t
> -   https://layers.openembedded.org/layerindex/branch/master/layer/meta=
-gplv2/.
> +   :oe_layer:`/meta-gplv2/`.
> =20
>  These relocated GPLv2 recipes do not receive the same level of
>  maintenance as other core recipes. The recipes do not get security fix=
es
> diff --git a/documentation/toaster-manual/intro.rst b/documentation/toa=
ster-manual/intro.rst
> index c78b3f53d..57e5b2bb7 100644
> --- a/documentation/toaster-manual/intro.rst
> +++ b/documentation/toaster-manual/intro.rst
> @@ -27,7 +27,7 @@ extensive information about the build process.
>     -  Browse layers listed in the various
>        :ref:`layer sources <toaster-manual/reference:layer source>`
>        that are available in your project (e.g. the OpenEmbedded Layer =
Index at
> -      http://layers.openembedded.org/layerindex/).
> +      :oe_layerindex:`/`).

Probably wanted :oe_layer:`/` here since we're aiming at giving the link
to the Layer tab (though, yes, by default it redirects to the layer tab, =
and
yes, it does not work currently :)).

> =20
>     -  Browse images, recipes, and machines provided by those layers.
> =20
> diff --git a/documentation/toaster-manual/reference.rst b/documentation=
/toaster-manual/reference.rst
> index dfe51889e..34a1f39cf 100644
> --- a/documentation/toaster-manual/reference.rst
> +++ b/documentation/toaster-manual/reference.rst
> @@ -24,7 +24,7 @@ type of layer source called a "layer index."
>  A layer index is a web application that contains information about a s=
et
>  of custom layers. A good example of an existing layer index is the
>  OpenEmbedded Layer Index. A public instance of this layer index exists
> -at http://layers.openembedded.org. You can find the code for this
> +at :oe_layerindex:`/`. You can find the code for this

Ditto.

>  layer index's web application at :yocto_git:`/layerindex-web/`.
> =20
>  When you tie a layer source into Toaster, it can query the layer sourc=
e
> @@ -81,7 +81,7 @@ describes two methods by which you can configure and =
use your layer
>  index.
> =20
>  In the previous section, the code for the OpenEmbedded Metadata Index
> -(i.e. http://layers.openembedded.org) was referenced. You can use
> +(i.e. :oe_layerindex:`/`) was referenced. You can use
>  this code, which is at :yocto_git:`/layerindex-web/`, as a base to cre=
ate
>  your own layer index.
> =20
> diff --git a/documentation/toaster-manual/setup-and-use.rst b/documenta=
tion/toaster-manual/setup-and-use.rst
> index 2cb7884eb..a3225da91 100644
> --- a/documentation/toaster-manual/setup-and-use.rst
> +++ b/documentation/toaster-manual/setup-and-use.rst
> @@ -462,9 +462,8 @@ Using the Toaster Web Interface
> =20
>  The Toaster web interface allows you to do the following:
> =20
> --  Browse published layers in the `OpenEmbedded Layer
> -   Index <http://layers.openembedded.org>`__ that are available for yo=
ur
> -   selected version of the build system.
> +-  Browse published layers in the :oe_layer:`OpenEmbedded Layer Index =
<>`

Ditto.

> +   that are available for your selected version of the build system.
> =20
>  -  Import your own layers for building.
> =20
> @@ -573,11 +572,11 @@ However, the "Local Yocto Project" release will n=
ot provide you with any
>  compatible layers, other than the three core layers that come with the
>  Yocto Project:
> =20
> --  `openembedded-core <http://layers.openembedded.org/layerindex/branc=
h/master/layer/openembedded-core/>`__
> +-  :oe_layer:`openembedded-core </openembedded-core/>`
> =20
> --  `meta-poky <http://layers.openembedded.org/layerindex/branch/master=
/layer/meta-poky/>`__
> +-  :oe_layer:`meta-poky </meta-poky/>`
> =20
> --  `meta-yocto-bsp <http://layers.openembedded.org/layerindex/branch/m=
aster/layer/meta-yocto-bsp/>`__
> +-  :oe_layer:`meta-yocto-bsp </meta-yocto-bsp/>`
> =20
>  .. image:: figures/compatible-layers.png
>     :align: center
> diff --git a/documentation/transitioning-to-a-custom-environment.rst b/=
documentation/transitioning-to-a-custom-environment.rst
> index 415f295b3..76a3215de 100644
> --- a/documentation/transitioning-to-a-custom-environment.rst
> +++ b/documentation/transitioning-to-a-custom-environment.rst
> @@ -29,8 +29,8 @@ Transitioning to a custom environment for systems dev=
elopment
> =20
>  #. **Find and acquire the best BSP for your target**.
>     Use the :yocto_home:`Yocto Project curated layer index
> -   </software-overview/layers/>` or even the `OpenEmbedded layer index
> -   <https://layers.openembedded.org>`_ to find and acquire the best BS=
P for your
> +   </software-overview/layers/>` or even the :oe_layer:`OpenEmbedded
> +   layer index <>` to find and acquire the best BSP for your

Ditto.

>     target board. The Yocto Project layer index BSPs are regularly vali=
dated. The
>     best place to get your first BSP is from your silicon manufacturer =
or board
>     vendor =E2=80=93 they can point you to their most qualified efforts=
. In general, for
> diff --git a/documentation/what-i-wish-id-known.rst b/documentation/wha=
t-i-wish-id-known.rst
> index a051036bb..a52a16656 100644
> --- a/documentation/what-i-wish-id-known.rst
> +++ b/documentation/what-i-wish-id-known.rst
> @@ -27,11 +27,10 @@ contact us with other suggestions.
>     to be responsible for your own updates.
> =20
>  #. **Get to know the layer index:**
> -   All layers can be found in the `layer index
> -   <https://layers.openembedded.org/>`_. Layers which have applied for=
 Yocto
> -   Project Compatible status (structure continuity assurance and testi=
ng) can be
> -   found in the :yocto_home:`Yocto Project Compatible index
> -   </software-over/layer/>`.  Generally check the Compatible layer ind=
ex first,
> +   All layers can be found in the :oe_layer:`layer index <>`. Layers w=
hich
> +   have applied for Yocto Project Compatible status (structure continu=
ity
> +   assurance and testing) can be found in the :yocto_home:`Yocto Proje=
ct Compatible index
> +   </software-over/layer/>`. Generally check the Compatible layer inde=
x first,
>     and if you don't find the necessary layer check the general layer i=
ndex. The
>     layer index is an original artifact from the Open Embedded Project.=
 As such,
>     that index doesn't have the curating and testing that the Yocto Pro=
ject
> @@ -172,7 +171,7 @@ contact us with other suggestions.
>     * add an ssh server to an image (enable transferring of files to ta=
rget)
>     * know the anatomy of a recipe
>     * know how to create and use layers
> -   * find recipes (with the `OpenEmbedded Layer index <https://layers.=
openembedded.org>`_)
> +   * find recipes (with the :oe_layerindex:`OpenEmbedded Layer index <=
>`)

If we went for the second suggested :oe_metadataindex:, we could use:
:oe_metadataindex:`/recipes` here.

Thanks,
Quentin
