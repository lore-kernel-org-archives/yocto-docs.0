Received: from bsmtp3.bon.at (bsmtp3.bon.at [213.33.87.17])
 by mx.groups.io with SMTP id smtpd.web10.33010.1607946001745599027
 for <docs@lists.yoctoproject.org>;
 Mon, 14 Dec 2020 03:40:02 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: streamunlimited.com, ip: 213.33.87.17, mailfrom: quentin.schulz@streamunlimited.com)
Received: from qschulz (vpn.streamunlimited.com [91.114.0.140])
	by bsmtp3.bon.at (Postfix) with ESMTPSA id 4CvfZQ64NPz5tlC;
	Mon, 14 Dec 2020 12:39:58 +0100 (CET)
Date: Mon, 14 Dec 2020 12:39:57 +0100
From: "Quentin Schulz" <quentin.schulz@streamunlimited.com>
To: Paul Barker <pbarker@konsulko.com>
Cc: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: Re: [docs] [PATCH 2/4] documentation: Simplify layerindex and layer links
Message-ID: <20201214113957.f4ymffaz2rski7qx@qschulz>
References: <20201212203707.7428-1-pbarker@konsulko.com>
 <20201212203707.7428-2-pbarker@konsulko.com>
 <20201214093005.pfo7exhdx36sgoyi@qschulz>
 <CAM9ZRVu4D9ba2zFHgogBS7MkOhR2CxRn2ORCDTbd7rNcw9+2aw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAM9ZRVu4D9ba2zFHgogBS7MkOhR2CxRn2ORCDTbd7rNcw9+2aw@mail.gmail.com>
User-Agent: NeoMutt/20180716
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Dec 14, 2020 at 11:14:57AM +0000, Paul Barker wrote:
> On Mon, 14 Dec 2020 at 09:30, Quentin Schulz
> <quentin.schulz@streamunlimited.com> wrote:
> >
> > Hi Paul,
> >
> > On Sat, Dec 12, 2020 at 08:37:05PM +0000, Paul Barker wrote:
> > > Signed-off-by: Paul Barker <pbarker@konsulko.com>
> > > ---
> > >  documentation/conf.py                             |  2 ++
> > >  documentation/dev-manual/common-tasks.rst         |  9 ++++-----
> > >  documentation/overview-manual/concepts.rst        | 15 ++++++---------
> > >  documentation/overview-manual/yp-intro.rst        |  6 ++----
> > >  documentation/ref-manual/migration-2.3.rst        |  2 +-
> > >  documentation/toaster-manual/intro.rst            |  2 +-
> > >  documentation/toaster-manual/reference.rst        |  4 ++--
> > >  documentation/toaster-manual/setup-and-use.rst    | 11 +++++------
> > >  .../transitioning-to-a-custom-environment.rst     |  4 ++--
> > >  documentation/what-i-wish-id-known.rst            | 11 +++++------
> > >  10 files changed, 30 insertions(+), 36 deletions(-)
> > >
> > > diff --git a/documentation/conf.py b/documentation/conf.py
> > > index b5351599d..57b9b6fd6 100644
> > > --- a/documentation/conf.py
> > > +++ b/documentation/conf.py
> > > @@ -80,6 +80,8 @@ extlinks = {
> > >      'oe_lists': ('https://lists.openembedded.org%s', None),
> > >      'oe_git': ('https://git.openembedded.org%s', None),
> > >      'oe_wiki': ('https://www.openembedded.org/wiki%s', None),
> > > +    'oe_layerindex': ('https://layers.openembedded.org%s', None),
> > > +    'oe_layer': ('https://layers.openembedded.org/layerindex/branch/master/layer/%s/', None),
> >
> > 'oe_layer': ('https://layers.openembedded.org/layerindex/branch/master/layer%s', None),
> >
> > To stay consistent with the rest? (Ultimately, we'll add the trailing
> > slash, but probably all at once).
> 
> I don't really like the way that would look in the text, e.g:
> 
>     :oe_layer:`meta-poky </meta-poky/>`
> 
> I suppose it would be ok though.
> 

It'd be :oe_layer:`/meta-poky` (if Michael can fix it, else add a
trailing slash).

The label of the hyperlink anyway needs to be explicit, whichever is
the implementation choice.

> >
> > Ah.... now that I tested it, for some reason:
> > https://layers.openembedded.org/layerindex/branch/master/layer/meta-raspberrypi/
> > works but not:
> > https://layers.openembedded.org/layerindex/branch/master/layer/meta-raspberrypi
> >
> > I'd maybe contact Michael about this?
> 
> This did surprise me. I'll send an email.
> 

Thanks!

> >
> > >  }
> > >
> > >  # Intersphinx config to use cross reference with Bitbake user manual
> > > diff --git a/documentation/dev-manual/common-tasks.rst b/documentation/dev-manual/common-tasks.rst
> > > index 39db6563c..79acb8671 100644
> > > --- a/documentation/dev-manual/common-tasks.rst
> > > +++ b/documentation/dev-manual/common-tasks.rst
> > > @@ -38,9 +38,8 @@ Follow these general steps to create your layer without using tools:
> > >
> > >  1. *Check Existing Layers:* Before creating a new layer, you should be
> > >     sure someone has not already created a layer containing the Metadata
> > > -   you need. You can see the `OpenEmbedded Metadata
> > > -   Index <https://layers.openembedded.org/layerindex/layers/>`__ for a
> > > -   list of layers from the OpenEmbedded community that can be used in
> > > +   you need. You can see the :oe_layerindex:`OpenEmbedded Metadata Index <>`
> >
> > This isn't great as you rely on the default tab of
> > https://layers.openembedded.org to be layers', but that can change in
> > the future.
> 
> So should we have:
> 
>     :oe_layerindex:`OpenEmbedded Metadata Index </layerindex/layers/>`

What about having :oe_metadataindex: which points to the home page?

And oe_layerindex linking to
https://layers.openembedded.org/layerindex/layers/?

Then oe_layer to
https://layers.openembedded.org/layerindex/layers/master/layer%s
(with/without the additional trailing slashes).

> 
> It seems redundant but as you say it would protect against changes to
> the layerindex default tab. Are there any such changes planned or is
> this just hypothetical?
> 
> >
> > What about :oe_layer:`<>`? The resulting URL isn't great for now because
> > of the slashes around %s but that's the best I can suggest right now.
> 
> I don't like this as we're not talking about a specific layer here.
> 

What about the suggested oe_layerindex above?

I don't have the final word though, so maybe Nicolas or Richard should
chime in :)

[...]
> > > diff --git a/documentation/ref-manual/migration-2.3.rst b/documentation/ref-manual/migration-2.3.rst
> > > index 3e9758119..ef03ab125 100644
> > > --- a/documentation/ref-manual/migration-2.3.rst
> > > +++ b/documentation/ref-manual/migration-2.3.rst
> > > @@ -238,7 +238,7 @@ to substitute a GPLv2 version of a GPLv3 recipe, then you must add the
> > >  .. note::
> > >
> > >     You can ``find meta-gplv2`` layer in the OpenEmbedded layer index at
> > > -   https://layers.openembedded.org/layerindex/branch/master/layer/meta-gplv2/.
> > > +   :oe_layer:`meta-gplv2`.
> > >
> >
> > Should we fix the branch to "pyro" instead of master if ever the
> > meta-gplv2 layer disappears in more recent versions of Yocto (it's a
> > migration doc for 2.3).
> 
> The master branch should never be deleted, it should just stop being
> updated at some point.
> 

I don't know exactly how the layer index works to be honest.

My worry is that https://layers.openembedded.org/layerindex/branch/master/layer/meta-gplv2/
might point to 404 or something like this if meta-gplv2 drops support
for curent/newer version of Yocto.

But since I checked
https://layers.openembedded.org/layerindex/branch/master/layer/meta-fsl-arm
and (reverse example) https://layers.openembedded.org/layerindex/branch/daisy/layer/meta-python2/
it seems ok?

Was just thinking out loud :)

Cheers,
Quentin
