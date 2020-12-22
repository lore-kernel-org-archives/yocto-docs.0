Received: from mail-oi1-f176.google.com (mail-oi1-f176.google.com [209.85.167.176])
 by mx.groups.io with SMTP id smtpd.web08.12452.1608650349247863045
 for <docs@lists.yoctoproject.org>;
 Tue, 22 Dec 2020 07:19:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=QXlTTEkp;
 spf=pass (domain: konsulko.com, ip: 209.85.167.176, mailfrom: paul.barker@konsulko.com)
Received: by mail-oi1-f176.google.com with SMTP id 15so15078508oix.8
        for <docs@lists.yoctoproject.org>; Tue, 22 Dec 2020 07:19:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Dp6ZcS/CeY640sd2gCsad/4ZHH/qlHI9FuckUTpu1aM=;
        b=QXlTTEkpHnwrcfoVYfADQjq/ZgS/23j5FAAYAQ3GT/lIiblPbKtKGKX4IwEMj8uKm3
         lQ16qYqZOhqw/p3ZM3ZaC88sBnye1s8SeoyBahtH+R9uSbKAfRlYROl0wTT5fAlx9lZW
         dFM4MgY32MMEfSjpykKfRVWdhjJqp1Nz4XtWQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Dp6ZcS/CeY640sd2gCsad/4ZHH/qlHI9FuckUTpu1aM=;
        b=uk1Wq3KLWW2zgfX1xqT8yoheGrtEQ8o4nd+uqmJN7QA7X6vdCPcxYfB+5uABxaM9/1
         8I7YSMQc2PJ+Y6mXrjT6ymLJtHsuPxlEiMFZBQE1EIjlYmToUFz/jYkpxSCdJxFkMAOv
         rWKSWz8MN3/2Xdxmi3OFb8hsv9+MIdcikH/5BRSolFtAxpS8V21Bl00ob+OlG6S5VBZ5
         BvuCMYke4OugeXs7aFKkLtZqRakqUa7mjFZUFUmC1YtywdkKEH2BZaka9kj7fGep403n
         0bb7Kd790xSB6A9/4ZjxAn6Tr5YixapUIrzoBOQYLPurXfiDhNug2332bGmJ7K10vkIO
         vzXA==
X-Gm-Message-State: AOAM530wjdltZR2Vt4Bz0vKtlbABjpiXhXYhnQL7GsUYXsJGHSie8eev
	DOhF/BeIkUq6aWLfGtwo6hUTClGbNPiLvqxy1k8kTUitDPo=
X-Google-Smtp-Source: ABdhPJyNtu2+0ZuHPNZvvFcDHfFK0So2ksEHenIkdxyb8i4bw+7bq9ZImTUjs7XDd7nWHO1FVujkuUw11bK7q806Hck=
X-Received: by 2002:aca:d882:: with SMTP id p124mr7501287oig.152.1608650348525;
 Tue, 22 Dec 2020 07:19:08 -0800 (PST)
MIME-Version: 1.0
References: <20201222095758.7411-1-pbarker@konsulko.com> <20201222095758.7411-3-pbarker@konsulko.com>
 <20201222141900.ug5bazv7e4jjl3h5@qschulz>
In-Reply-To: <20201222141900.ug5bazv7e4jjl3h5@qschulz>
From: "Paul Barker" <pbarker@konsulko.com>
Date: Tue, 22 Dec 2020 15:18:58 +0000
Message-ID: <CAM9ZRVvo1tAQaX9GaJ+_-hEz22hkGZYeXRN7=rf0bpXVyeMsbg@mail.gmail.com>
Subject: Re: [docs] [PATCH v2 2/6] documentation: Simplify layerindex and layer links
To: Quentin Schulz <quentin.schulz@streamunlimited.com>
Cc: YP docs mailing list <docs@lists.yoctoproject.org>
Content-Type: text/plain; charset="UTF-8"

On Tue, 22 Dec 2020 at 14:19, Quentin Schulz
<quentin.schulz@streamunlimited.com> wrote:
>
> Hi Paul,
>
> On Tue, Dec 22, 2020 at 09:57:54AM +0000, Paul Barker wrote:
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
> > index b5351599d..68eb92b0a 100644
> > --- a/documentation/conf.py
> > +++ b/documentation/conf.py
> > @@ -80,6 +80,8 @@ extlinks = {
> >      'oe_lists': ('https://lists.openembedded.org%s', None),
> >      'oe_git': ('https://git.openembedded.org%s', None),
> >      'oe_wiki': ('https://www.openembedded.org/wiki%s', None),
> > +    'oe_layerindex': ('https://layers.openembedded.org%s', None),
> > +    'oe_layer': ('https://layers.openembedded.org/layerindex/branch/master/layer%s', None),
>
> I've contacted Michael Halstead about the issue we were talking about in
> the v1. He's managed to redirect
> https://layers.openembedded.org/layerindex/branch/master/layer/meta-xxx
> to
> https://layers.openembedded.org/layerindex/branch/master/layer/meta-xxx/
>
> therefore we can have consistency in our docs and have only the leading
> slash.
>
> Please change your:
> :oe_layer:`/meta-xxx/` into :oe_layer:`/meta-xxx`

Will do, thanks for following this up.

>
> >  }
> >
> >  # Intersphinx config to use cross reference with Bitbake user manual
> > diff --git a/documentation/dev-manual/common-tasks.rst b/documentation/dev-manual/common-tasks.rst
> > index 39db6563c..b2f433e1d 100644
> > --- a/documentation/dev-manual/common-tasks.rst
> > +++ b/documentation/dev-manual/common-tasks.rst
> > @@ -38,9 +38,8 @@ Follow these general steps to create your layer without using tools:
> >
> >  1. *Check Existing Layers:* Before creating a new layer, you should be
> >     sure someone has not already created a layer containing the Metadata
> > -   you need. You can see the `OpenEmbedded Metadata
> > -   Index <https://layers.openembedded.org/layerindex/layers/>`__ for a
> > -   list of layers from the OpenEmbedded community that can be used in
> > +   you need. You can see the :oe_layer:`OpenEmbedded Metadata Index <>`
>
> I'm pretty sure it's me who suggested this so my bad, this does not work
> unfortunately :/
>
> :oe_layer:`<>` results in https://layers.openembedded.org/layerindex/branch/master/layer/
> but it's actually:
> https://layers.openembedded.org/layerindex/branch/master/layers/ we want
> (note the additional `s`).
>
> What about:
> 'oe_metadataindex': ('https://layers.openembedded.org%s', None),
> 'oe_layer': ('https://layers.openembedded.org/layerindex/branch/master/layer%s', None),
>
> and have in poky.yaml:
> OE_LAYERINDEX : "https://layers.openembedded.org/layerindex/layers/"
> ?
>
> replacing :oe_layer:`<>` with &OE_LAYERINDEX; and :oe_layerindex:
> with :oe_metadataindex: (if it is appropriate).
>
> or
> 'oe_metadataindex': ('https://layers.openembedded.org/layerindex%s', None),
> 'oe_layer': ('https://layers.openembedded.org/layerindex/branch/master/layer%s', None),
>
> replacing :oe_layer:`<>` with :oe_metadataindex:`/layers` (note at the
> time of writing, this isn't working yet but I've asked Michael about it
> already).
>
> TL;DR: if we want to merge this ASAP, we'd probably want the
> :oe_layer:`/meta-xxx/` into :oe_layer:`/meta-xxx` and
> :oe_layer:`<>` into :oe_layerindex:`/layerindex/branch/master/layers` changes
> and we can make the latter change neater in a followup patch.

TBH I'm just going to fall back to what I had originally here. We'll use:

    :oe_layerindex:`OpenEmbedded Metadata Index <>`

If someone changes the default tab so the layer index in the future
then the docs can be changed at that time.

-- 
Paul Barker
Konsulko Group
