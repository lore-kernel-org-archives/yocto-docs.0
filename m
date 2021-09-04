Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
 by mx.groups.io with SMTP id smtpd.web11.12319.1630768171280740801
 for <docs@lists.yoctoproject.org>;
 Sat, 04 Sep 2021 08:09:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=B55MUIoP;
 spf=pass (domain: gmail.com, ip: 209.85.160.178, mailfrom: uvv.mail@gmail.com)
Received: by mail-qt1-f178.google.com with SMTP id s15so1774907qta.10
        for <docs@lists.yoctoproject.org>; Sat, 04 Sep 2021 08:09:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=thNwzWbo/G0zqG0lHIVYyeCxY0AFi7NZyjsW5majmig=;
        b=B55MUIoP8i1B4xQWtEEqbjhca4URzgg3UtL0T0rjQP8d8zguN65HUY5b1JKQVS69Ho
         rjyCPmhUStYNuUiHfFxucI7zz3XLp7RIHOy0/I90emn0Ae4rDbX+YI4uu0wJBrSU+BhF
         BbDOEtICWk9SZ1kB4xEZ2vbKR1uNPEtCUh6ONBxUpnjmVXPkqk9eyCwemnVIzl8TPDoc
         cHbJKrhhuNB5zPIodaNxhC0leBSE9jiQFDfcn5TpQ0/fOQoNpsftH0J6TS5A5Wia+8/X
         wC/N7akoilanDp6h2woLAKdYjKgoiqCrzhRJSOxzNr0ipLF+wOEKR7/EAjjYm1Z9kl+c
         sPpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=thNwzWbo/G0zqG0lHIVYyeCxY0AFi7NZyjsW5majmig=;
        b=pQ01o1LAbF689LAFwNBfEPyyI/QQXvI+CAzVrRdbUemrgCJY4G68lxA/eCsDDBtP/8
         N+Jwwtbw2Y47RW8vM/j4yA9nG8CVjgP79Am7UPpS/vrMgq9ELPmdz2I/24nx+PNewL9b
         zFcAQ11TIapQjSefh+9+RMqtHlQKwHfUSwpMxeTUQZ/c6b75fDu7k0/LRf9HLGkFwGzV
         N/CimQlIBlrYY1vROFDpPVdMzgDCHXt7T2o1CTeBX6Q5bcU6B3V+M9ZGiDHhvkzVkB1E
         KNa7o0008ihRbYtCPAM4Wz5JACLGubqaK3PRPMIofgJ3WCiYeBcdzx1oU4txOeWG7ih0
         p6xw==
X-Gm-Message-State: AOAM5311BhOepBbkL9g3RjIIxQYnHs3l3MQL/Yq0CLwTk7YPleNJ8gDA
	ujsuE/ebMswGZEuIN5SxR/pvgfNE5KFXOK527+6cbxC2rdw4rw==
X-Google-Smtp-Source: ABdhPJwZVl+GUtz7rD/ujB3RzANL9HUXM38KGtNI+QzUXMnNIa76HDzd+rWi2e/g/ts+79b2Ao/uafW0GCQ82AeekT0=
X-Received: by 2002:ac8:4716:: with SMTP id f22mr3811383qtp.250.1630768170382;
 Sat, 04 Sep 2021 08:09:30 -0700 (PDT)
MIME-Version: 1.0
References: <169DBA2544D42714.9946@lists.yoctoproject.org>
In-Reply-To: <169DBA2544D42714.9946@lists.yoctoproject.org>
From: "Vyacheslav Yurkov" <uvv.mail@gmail.com>
Date: Sat, 4 Sep 2021 18:09:18 +0300
Message-ID: <CAKHfEah0RqHENWV-Jr5u50CJOBtv6FyRX3KtRsu9YS=nwso3=g@mail.gmail.com>
Subject: Re: [docs] [PATCH v2] ref-manual: add overlayfs class
To: Vyacheslav Yurkov <uvv.mail@gmail.com>
Cc: docs@lists.yoctoproject.org
Content-Type: multipart/alternative; boundary="00000000000081ba3a05cb2ccd7b"

--00000000000081ba3a05cb2ccd7b
Content-Type: text/plain; charset="UTF-8"

Any more comments on this patch?

Vyacheslav

On Sun, Aug 22, 2021, 23:15 Vyacheslav Yurkov via lists.yoctoproject.org
<uvv.mail=gmail.com@lists.yoctoproject.org> wrote:

> Signed-off-by: Vyacheslav Yurkov <uvv.mail@gmail.com>
> ---
>  documentation/ref-manual/classes.rst | 49 ++++++++++++++++++++++++++++
>  1 file changed, 49 insertions(+)
>
> diff --git a/documentation/ref-manual/classes.rst
> b/documentation/ref-manual/classes.rst
> index 3af023895..ca6430034 100644
> --- a/documentation/ref-manual/classes.rst
> +++ b/documentation/ref-manual/classes.rst
> @@ -1710,6 +1710,55 @@ one such example. However, being aware of this
> class can reduce the
>  proliferation of different versions of similar classes across multiple
>  layers.
>
> +.. _ref-classes-overlayfs:
> +
> +``overlayfs.bbclass``
> +=======================
> +
> +It's often desired in Embedded System design to have a read-only rootfs.
> +But a lot of different applications might want to have a read-write
> access to
> +some parts of a filesystem. It can be especially useful when your update
> mechanism
> +overwrites the whole rootfs, but you want your application data to be
> preserved
> +between updates. The :ref:`overlayfs <ref-classes-overlayfs>` class
> provides a way
> +to achieve that by means of ``overlayfs`` and at the same time keeping
> the base
> +rootfs read-only.
> +
> +To use this class, set a mount point for a partition overlayfs is going
> to use as upper
> +layer in your machine configuration. Underlying file system can be
> anything that
> +is supported by overlayfs. This has to be done in your machine
> configuration::
> +
> +  OVERLAYFS_MOUNT_POINT[data] = "/data"
> +
> +.. note::
> +
> +  * QA check fails to catch file existence if you redefine this variable
> in your recipe!
> +  * Only existence of the systemd mount unit file is checked, not its
> content.
> +  * To get more details on overlayfs, its internals and supported
> operations, please refer
> +    to the official documentation of the `Linux kernel <
> https://www.kernel.org/doc/html/latest/filesystems/overlayfs.html>`_
> +
> +The class assumes you have a ``data.mount`` systemd unit defined
> elsewhere in your BSP
> +(e.g. in ``systemd-machine-units`` recipe) and it's installed to the
> image.
> +
> +Then you can specify writable directories on a recipe basis (e.g. in
> my-application.bb)::
> +
> +  OVERLAYFS_WRITABLE_PATHS[data] = "/usr/share/my-custom-application"
> +
> +To support several mount points you can use a different variable flag.
> Assuming we
> +want to have a writable location on the file system, but not interested
> where the data
> +survives a reboot, then we could have a ``mnt-overlay.mount`` unit for a
> ``tmpfs`` file system.
> +
> +In your machine configuration::
> +
> +  OVERLAYFS_MOUNT_POINT[mnt-overlay] = "/mnt/overlay"
> +
> +and then in your recipe::
> +
> +  OVERLAYFS_WRITABLE_PATHS[mnt-overlay] = "/usr/share/another-application"
> +
> +.. note::
> +
> +   The class does not support ``/etc`` directory itself, because
> ``systemd`` depends on it
> +
>  .. _ref-classes-own-mirrors:
>
>  ``own-mirrors.bbclass``
> --
> 2.28.0
>
>
> 
>
>

--00000000000081ba3a05cb2ccd7b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div>Any more comments on this patch?</div><div dir=3D"au=
to"><br></div><div dir=3D"auto">Vyacheslav<br><br><div class=3D"gmail_quote=
" dir=3D"auto"><div dir=3D"ltr" class=3D"gmail_attr">On Sun, Aug 22, 2021, =
23:15 Vyacheslav Yurkov via <a href=3D"http://lists.yoctoproject.org">lists=
.yoctoproject.org</a> &lt;uvv.mail=3D<a href=3D"mailto:gmail.com@lists.yoct=
oproject.org">gmail.com@lists.yoctoproject.org</a>&gt; wrote:<br></div><blo=
ckquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #c=
cc solid;padding-left:1ex">Signed-off-by: Vyacheslav Yurkov &lt;<a href=3D"=
mailto:uvv.mail@gmail.com" target=3D"_blank" rel=3D"noreferrer">uvv.mail@gm=
ail.com</a>&gt;<br>
---<br>
=C2=A0documentation/ref-manual/classes.rst | 49 +++++++++++++++++++++++++++=
+<br>
=C2=A01 file changed, 49 insertions(+)<br>
<br>
diff --git a/documentation/ref-manual/classes.rst b/documentation/ref-manua=
l/classes.rst<br>
index 3af023895..ca6430034 100644<br>
--- a/documentation/ref-manual/classes.rst<br>
+++ b/documentation/ref-manual/classes.rst<br>
@@ -1710,6 +1710,55 @@ one such example. However, being aware of this class=
 can reduce the<br>
=C2=A0proliferation of different versions of similar classes across multipl=
e<br>
=C2=A0layers.<br>
<br>
+.. _ref-classes-overlayfs:<br>
+<br>
+``overlayfs.bbclass``<br>
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
+<br>
+It&#39;s often desired in Embedded System design to have a read-only rootf=
s.<br>
+But a lot of different applications might want to have a read-write access=
 to<br>
+some parts of a filesystem. It can be especially useful when your update m=
echanism<br>
+overwrites the whole rootfs, but you want your application data to be pres=
erved<br>
+between updates. The :ref:`overlayfs &lt;ref-classes-overlayfs&gt;` class =
provides a way<br>
+to achieve that by means of ``overlayfs`` and at the same time keeping the=
 base<br>
+rootfs read-only.<br>
+<br>
+To use this class, set a mount point for a partition overlayfs is going to=
 use as upper<br>
+layer in your machine configuration. Underlying file system can be anythin=
g that<br>
+is supported by overlayfs. This has to be done in your machine configurati=
on::<br>
+<br>
+=C2=A0 OVERLAYFS_MOUNT_POINT[data] =3D &quot;/data&quot;<br>
+<br>
+.. note::<br>
+<br>
+=C2=A0 * QA check fails to catch file existence if you redefine this varia=
ble in your recipe!<br>
+=C2=A0 * Only existence of the systemd mount unit file is checked, not its=
 content.<br>
+=C2=A0 * To get more details on overlayfs, its internals and supported ope=
rations, please refer<br>
+=C2=A0 =C2=A0 to the official documentation of the `Linux kernel &lt;<a hr=
ef=3D"https://www.kernel.org/doc/html/latest/filesystems/overlayfs.html" re=
l=3D"noreferrer noreferrer" target=3D"_blank">https://www.kernel.org/doc/ht=
ml/latest/filesystems/overlayfs.html</a>&gt;`_<br>
+<br>
+The class assumes you have a ``data.mount`` systemd unit defined elsewhere=
 in your BSP<br>
+(e.g. in ``systemd-machine-units`` recipe) and it&#39;s installed to the i=
mage.<br>
+<br>
+Then you can specify writable directories on a recipe basis (e.g. in <a hr=
ef=3D"http://my-application.bb" rel=3D"noreferrer noreferrer" target=3D"_bl=
ank">my-application.bb</a>)::<br>
+<br>
+=C2=A0 OVERLAYFS_WRITABLE_PATHS[data] =3D &quot;/usr/share/my-custom-appli=
cation&quot;<br>
+<br>
+To support several mount points you can use a different variable flag. Ass=
uming we<br>
+want to have a writable location on the file system, but not interested wh=
ere the data<br>
+survives a reboot, then we could have a ``mnt-overlay.mount`` unit for a `=
`tmpfs`` file system.<br>
+<br>
+In your machine configuration::<br>
+<br>
+=C2=A0 OVERLAYFS_MOUNT_POINT[mnt-overlay] =3D &quot;/mnt/overlay&quot;<br>
+<br>
+and then in your recipe::<br>
+<br>
+=C2=A0 OVERLAYFS_WRITABLE_PATHS[mnt-overlay] =3D &quot;/usr/share/another-=
application&quot;<br>
+<br>
+.. note::<br>
+<br>
+=C2=A0 =C2=A0The class does not support ``/etc`` directory itself, because=
 ``systemd`` depends on it<br>
+<br>
=C2=A0.. _ref-classes-own-mirrors:<br>
<br>
=C2=A0``own-mirrors.bbclass``<br>
-- <br>
2.28.0<br>
<br>
<br>
<br>
<br>
</blockquote></div></div></div>

--00000000000081ba3a05cb2ccd7b--
