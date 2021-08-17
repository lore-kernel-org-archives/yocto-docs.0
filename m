Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com [209.85.222.175])
 by mx.groups.io with SMTP id smtpd.web09.34646.1629170989158407489
 for <docs@lists.yoctoproject.org>;
 Mon, 16 Aug 2021 20:29:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=L0zEpuJy;
 spf=pass (domain: gmail.com, ip: 209.85.222.175, mailfrom: uvv.mail@gmail.com)
Received: by mail-qk1-f175.google.com with SMTP id o123so16248900qkf.12
        for <docs@lists.yoctoproject.org>; Mon, 16 Aug 2021 20:29:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=inN48j43mJI6yggZxa1rsq944nSla4LOibek+h2YUNM=;
        b=L0zEpuJyyFnBVMrDx3xyJLB1szHIQY2qX0G5hbJFIMoX540fTy6AZVhPBzhzKS0tC8
         ReZVHHk6mCz40NhbLEj7wtSJohmBSs7sZCUQ4jA25bvldGeFZ/rvxZ8brPWILHauQQ+h
         eTlpCb3iKvl5SGJ5nOmTaCzc7pMmo+ELePT4KE11RP9YXWrXvIW/5CemObArikFCq5O3
         MRC2MK3BO99QYMQfkdkgL4Wm97ZrBm+YWg/F2K+aGjsy9QIrcSMhQCidnyHUud+e/BYW
         TD+nSINsKW/YE+RwPaosn/xI0dplnV8Pb92KBMDSb2ow9+5jar7ccp2DuvQFh2B1swSa
         DPrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=inN48j43mJI6yggZxa1rsq944nSla4LOibek+h2YUNM=;
        b=ZOFcO9MmLuB5hdfZkOb/2rL5PSkURX+zxgIAwut8JAWdJRv4gs86AtPX95sWo3IR2Y
         lkJOROpsDU9tmx60aSDzJIvjFjv47fEmvL96QBDe3X5PZiKiQF2K8xawHcEkpdbDDiR+
         HuTINSb3sWSVdVPh20fG8ScGIAekP6IpXv/jAKaMdFbeXAED0eW5/a08TpYbElwQjLrZ
         rVX7fO+ImuGuFovoNde7WeiZj8FywM/rnhZ6ediYskXW7Ymb4+Vio7frQQgXVoEm4gkX
         VyRtWVTt+QOdnryBE6SoKvtHaRVaL0ZDfYDDde4PLOA0u6beWwGhjln+QKX0mWBehdly
         JFiA==
X-Gm-Message-State: AOAM531sjrXeWG7Kz3k0kK7GZ930mEMSn7pveDasV1Uh8SpFdtJ7vyxS
	h77FFiEkmZcyQnHwCd2LjbCMvP7d8Iipg9r8ImGmlJYN
X-Google-Smtp-Source: ABdhPJzwKUdkCEH3I4gIm5OV+rS3qsNWGnL1DhiGCrTsjYXkX77szIYVGyn8Y/B/6z4W57uptClUCaF0VqJR8qtfRqs=
X-Received: by 2002:ae9:e915:: with SMTP id x21mr1705497qkf.183.1629170988153;
 Mon, 16 Aug 2021 20:29:48 -0700 (PDT)
MIME-Version: 1.0
References: <20210814042825.124630-1-uvv.mail@gmail.com> <20210816091427.25cqk6kx3mnoyua5@fedora>
In-Reply-To: <20210816091427.25cqk6kx3mnoyua5@fedora>
From: "Vyacheslav Yurkov" <uvv.mail@gmail.com>
Date: Tue, 17 Aug 2021 07:29:35 +0400
Message-ID: <CAKHfEaj4P2L7g993rqnQsuX5z42tKP6zZm7pznSESY9JtDbXMA@mail.gmail.com>
Subject: Re: [docs] [PATCH] ref-manual: add overlayfs class
To: Quentin Schulz <quentin.schulz@theobroma-systems.com>
Cc: docs@lists.yoctoproject.org
Content-Type: multipart/alternative; boundary="00000000000006fecd05c9b8ee7b"

--00000000000006fecd05c9b8ee7b
Content-Type: text/plain; charset="UTF-8"

Hi Quentin,
Thanks for the review! I'll address the notes in v2. A few answers to your
questions are inlined below.

On Mon, Aug 16, 2021, 13:14 Quentin Schulz <
quentin.schulz@theobroma-systems.com> wrote:

> Hi Vyacheslav,
>
> Thanks for the patch!
>
> On Sat, Aug 14, 2021 at 06:28:25AM +0200, Vyacheslav Yurkov wrote:
> > Signed-off-by: Vyacheslav Yurkov <uvv.mail@gmail.com>
> > ---
> >  documentation/ref-manual/classes.rst | 46 ++++++++++++++++++++++++++++
> >  1 file changed, 46 insertions(+)
> >
> > diff --git a/documentation/ref-manual/classes.rst
> b/documentation/ref-manual/classes.rst
> > index a98a64c43..5d33e81a1 100644
> > --- a/documentation/ref-manual/classes.rst
> > +++ b/documentation/ref-manual/classes.rst
> > @@ -1710,6 +1710,52 @@ one such example. However, being aware of this
> class can reduce the
> >  proliferation of different versions of similar classes across multiple
> >  layers.
> >
> > +.. _ref-classes-overlayfs:
> > +
> > +``overlayfs.bbclass``
> > +=======================
> > +
> > +
>
> One newline is enough :)
>
> > +It's often desired in Embedded System design to have a read-only rootfs.
> > +But a lot of different applications might want to have a read-write
> access to
> > +some parts of a filesystem. It can be especially useful when your
> update mechanism
> > +overwrites the whole rootfs, but you want your application data to be
> preserved
> > +between updates. The ``overlayfs`` class provides a way to achieve that
> by means
>
> s/``overlayfs``/:ref:`overlayfs <ref-classes-overlayfs>`/
>
> > +of overlayfs and at the same time keeping the base rootfs read-only.
> > +
>
> I would highlight overlayfs with tick quotes (``overlayfs``).
>
> > +To use this class, set a mount point for a partition overlayfs is going
> to use as upper
> > +layer in your machine configuration. Underlying file system can be
> anything that
> > +is supported by overlayfs. This has to be done in your machine
> configuration::
> > +
>
> How do I know what's supported by overlayfs? Where can I find this
> important piece of information?
>
> > +  OVERLAYFS_MOUNT_POINT[data] = "/data"
> > +
> > +.. note::
> > +
> > +  QA check fails to catch file existence if you redefine this variable
> in your recipe!
> > +
>
> What about:
> This variable must only be set from a configuration file as QA check will
> fail
> to catch file existence if this variable is also set in a recipe.
>
> Also, I'm not sure to understand what "catch file existence" means?
> Could you explain to me please :)
>

That means I check only that file exists in QA check, I do not check
whether it's a valid systemd mount unit (to avoid additional dependency on
systemd-native recipe).


> > +The class assumes you have a data.mount systemd unit defined elsewhere
> in your BSP
>
> s/data.mount/``data.mount``/
>
> > +(e.g. in systemd-machine-units recipe) and it's installed to the image.
> > +
>
> s/systemd-machine-units/``systemd-machine-units``/
>
> > +Then you can specify writable directories on a recipe basis::
> > +
>
> If package recipes are supported, does it actually make sense to have
> such variable in there instead of in image recipes?
>
> Just trying to know if we should highlight whether it's a bad idea for
> users to do so.
>

There are actually two pitfalls here.

Semantically directory belongs to a recipe it's used in. If you redefine
OVERLAYFS_WRITABLE_PATHS in another recipe, do_rootfs would fail when two
recipes install the same file.

Another trade-off I had to deal with is if you redefine
OVERLAYFS_MOUNT_POINT in a recipe, then I can't catch it in my QA check.
This is due to a bitbake limitation, in particular I can't forbid further
variable overrides. That's why I mentioned above that this variable has to
be set in machine configuration.

I hope that makes sense :)

Regards,
Vyacheslav


> > +  OVERLAYFS_WRITABLE_PATHS[data] = "/usr/share/my-custom-application"
> > +
> > +To support several mount points you can use a different variable flag.
> Assume we
>
> s/Assume/Assuming/ ?
>
> > +want to have a writable location on the file system, but not interested
> where the data
> > +survive a reboot. Then we could have a mnt-overlay.mount unit for a
> tmpfs file system.
> > +
>
> s/mnt-overlay.mount/``mnt-overlay.mount``/
>
> s/tmpfs/``tmpfs``/ ?
>
> > +In your machine configuration::
> > +
> > +  OVERLAYFS_MOUNT_POINT[mnt-overlay] = "/mnt/overlay"
> > +
> > +and then in your recipe::
> > +
> > +  OVERLAYFS_WRITABLE_PATHS[mnt-overlay] =
> "/usr/share/another-application"
> > +
> > +.. note::
> > +
> > +   The class does not support /etc directory itself, because systemd
> depends on it
> > +
>
> s/\/etc/``\/etc``/
>
> s/systemd/``systemd``/
>
> My nitpicks excluded, looks good :) ~
>
> Cheers,
> Quentin

--00000000000006fecd05c9b8ee7b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div>Hi Quentin,</div><div dir=3D"auto">Thanks for the re=
view! I&#39;ll address the notes in v2. A few answers to your questions are=
 inlined below.<br><br><div class=3D"gmail_quote" dir=3D"auto"><div dir=3D"=
ltr" class=3D"gmail_attr">On Mon, Aug 16, 2021, 13:14 Quentin Schulz &lt;<a=
 href=3D"mailto:quentin.schulz@theobroma-systems.com" rel=3D"noreferrer nor=
eferrer" target=3D"_blank">quentin.schulz@theobroma-systems.com</a>&gt; wro=
te:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;b=
order-left:1px #ccc solid;padding-left:1ex">Hi Vyacheslav,<br>
<br>
Thanks for the patch!<br>
<br>
On Sat, Aug 14, 2021 at 06:28:25AM +0200, Vyacheslav Yurkov wrote:<br>
&gt; Signed-off-by: Vyacheslav Yurkov &lt;<a href=3D"mailto:uvv.mail@gmail.=
com" rel=3D"noreferrer noreferrer noreferrer" target=3D"_blank">uvv.mail@gm=
ail.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 documentation/ref-manual/classes.rst | 46 ++++++++++++++++++++++=
++++++<br>
&gt;=C2=A0 1 file changed, 46 insertions(+)<br>
&gt; <br>
&gt; diff --git a/documentation/ref-manual/classes.rst b/documentation/ref-=
manual/classes.rst<br>
&gt; index a98a64c43..5d33e81a1 100644<br>
&gt; --- a/documentation/ref-manual/classes.rst<br>
&gt; +++ b/documentation/ref-manual/classes.rst<br>
&gt; @@ -1710,6 +1710,52 @@ one such example. However, being aware of this =
class can reduce the<br>
&gt;=C2=A0 proliferation of different versions of similar classes across mu=
ltiple<br>
&gt;=C2=A0 layers.<br>
&gt;=C2=A0 <br>
&gt; +.. _ref-classes-overlayfs:<br>
&gt; +<br>
&gt; +``overlayfs.bbclass``<br>
&gt; +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
<br>
&gt; +<br>
&gt; +<br>
<br>
One newline is enough :)<br>
<br>
&gt; +It&#39;s often desired in Embedded System design to have a read-only =
rootfs.<br>
&gt; +But a lot of different applications might want to have a read-write a=
ccess to<br>
&gt; +some parts of a filesystem. It can be especially useful when your upd=
ate mechanism<br>
&gt; +overwrites the whole rootfs, but you want your application data to be=
 preserved<br>
&gt; +between updates. The ``overlayfs`` class provides a way to achieve th=
at by means<br>
<br>
s/``overlayfs``/:ref:`overlayfs &lt;ref-classes-overlayfs&gt;`/<br>
<br>
&gt; +of overlayfs and at the same time keeping the base rootfs read-only.<=
br>
&gt; +<br>
<br>
I would highlight overlayfs with tick quotes (``overlayfs``).<br>
<br>
&gt; +To use this class, set a mount point for a partition overlayfs is goi=
ng to use as upper<br>
&gt; +layer in your machine configuration. Underlying file system can be an=
ything that<br>
&gt; +is supported by overlayfs. This has to be done in your machine config=
uration::<br>
&gt; +<br>
<br>
How do I know what&#39;s supported by overlayfs? Where can I find this<br>
important piece of information?<br>
<br>
&gt; +=C2=A0 OVERLAYFS_MOUNT_POINT[data] =3D &quot;/data&quot;<br>
&gt; +<br>
&gt; +.. note::<br>
&gt; +<br>
&gt; +=C2=A0 QA check fails to catch file existence if you redefine this va=
riable in your recipe!<br>
&gt; +<br>
<br>
What about:<br>
This variable must only be set from a configuration file as QA check will f=
ail<br>
to catch file existence if this variable is also set in a recipe.<br>
<br>
Also, I&#39;m not sure to understand what &quot;catch file existence&quot; =
means?<br>
Could you explain to me please :)<br></blockquote></div></div><div dir=3D"a=
uto"><br></div><div dir=3D"auto">That means I check only that file exists i=
n QA check, I do not check whether it&#39;s a valid systemd mount unit (to =
avoid additional dependency on systemd-native recipe).</div><div dir=3D"aut=
o"><br></div><div dir=3D"auto"><div class=3D"gmail_quote" dir=3D"auto"><blo=
ckquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #c=
cc solid;padding-left:1ex">
<br>
&gt; +The class assumes you have a data.mount systemd unit defined elsewher=
e in your BSP<br>
<br>
s/data.mount/``data.mount``/<br>
<br>
&gt; +(e.g. in systemd-machine-units recipe) and it&#39;s installed to the =
image.<br>
&gt; +<br>
<br>
s/systemd-machine-units/``systemd-machine-units``/<br>
<br>
&gt; +Then you can specify writable directories on a recipe basis::<br>
&gt; +<br>
<br>
If package recipes are supported, does it actually make sense to have<br>
such variable in there instead of in image recipes?<br>
<br>
Just trying to know if we should highlight whether it&#39;s a bad idea for<=
br>
users to do so.<br></blockquote></div></div><div dir=3D"auto"><br></div><di=
v dir=3D"auto">There are actually two pitfalls here.</div><div dir=3D"auto"=
><br></div><div dir=3D"auto">Semantically directory belongs to a recipe it&=
#39;s used in. If you redefine=C2=A0<span style=3D"font-family:sans-serif">=
OVERLAYFS_WRITABLE_PATHS</span>=C2=A0in another recipe, do_rootfs would fai=
l when two recipes install the same file.</div><div dir=3D"auto"><br></div>=
<div dir=3D"auto">Another trade-off I had to deal with is if you redefine O=
VERLAYFS_MOUNT_POINT in a recipe, then I can&#39;t catch it in my QA check.=
 This is due to a bitbake limitation, in particular I can&#39;t forbid furt=
her variable overrides. That&#39;s why I mentioned above that this variable=
 has to be set in machine configuration.</div><div dir=3D"auto"><br></div><=
div dir=3D"auto">I hope that makes sense :)</div><div dir=3D"auto"><br></di=
v><div dir=3D"auto">Regards,</div><div dir=3D"auto">Vyacheslav</div><div di=
r=3D"auto"><br></div><div dir=3D"auto"><div class=3D"gmail_quote" dir=3D"au=
to"><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-lef=
t:1px #ccc solid;padding-left:1ex">
<br>
&gt; +=C2=A0 OVERLAYFS_WRITABLE_PATHS[data] =3D &quot;/usr/share/my-custom-=
application&quot;<br>
&gt; +<br>
&gt; +To support several mount points you can use a different variable flag=
. Assume we<br>
<br>
s/Assume/Assuming/ ?<br>
<br>
&gt; +want to have a writable location on the file system, but not interest=
ed where the data<br>
&gt; +survive a reboot. Then we could have a mnt-overlay.mount unit for a t=
mpfs file system.<br>
&gt; +<br>
<br>
s/mnt-overlay.mount/``mnt-overlay.mount``/<br>
<br>
s/tmpfs/``tmpfs``/ ?<br>
<br>
&gt; +In your machine configuration::<br>
&gt; +<br>
&gt; +=C2=A0 OVERLAYFS_MOUNT_POINT[mnt-overlay] =3D &quot;/mnt/overlay&quot=
;<br>
&gt; +<br>
&gt; +and then in your recipe::<br>
&gt; +<br>
&gt; +=C2=A0 OVERLAYFS_WRITABLE_PATHS[mnt-overlay] =3D &quot;/usr/share/ano=
ther-application&quot;<br>
&gt; +<br>
&gt; +.. note::<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0The class does not support /etc directory itself, becaus=
e systemd depends on it<br>
&gt; +<br>
<br>
s/\/etc/``\/etc``/<br>
<br>
s/systemd/``systemd``/<br>
<br>
My nitpicks excluded, looks good :) ~<br>
<br>
Cheers,<br>
Quentin</blockquote></div></div></div>

--00000000000006fecd05c9b8ee7b--
