Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5889C25B75
	for <webhook@archiver.kernel.org>; Thu, 23 May 2024 07:36:49 +0000 (UTC)
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
 by mx.groups.io with SMTP id smtpd.web11.11430.1716449804050648859
 for <docs@lists.yoctoproject.org>;
 Thu, 23 May 2024 00:36:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=a3OV3EYS;
 spf=pass (domain: gmail.com, ip: 209.85.208.182, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-2e3efa18e6aso16766951fa.0
        for <docs@lists.yoctoproject.org>; Thu, 23 May 2024 00:36:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716449802; x=1717054602; darn=lists.yoctoproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=buLlfSRbNSquiXb28kC99WB3SCtrZrj462yD9YsyZ9s=;
        b=a3OV3EYS2EELYhhYAeKTwkXa5/Us5y86U65FqSYv4t6oa/3Rc3HUDJFDM5mFoAlTZQ
         8lctrLLXzE2hb8mR73SC3EPeGJLff/0yBAmenJIMdOCEV2hOXMEef5WAR/+YCPXZRmQP
         2sQFNvK4ihA9SXq+tuOHPG52FXQEtyxBP3Bgq9aNIIlvGdo3z4d3m60ymeXqBjfiOHNs
         j2YWmml60G+dO1tIR8umM5e5NebiyRzmKvgChE8faGA3Eyt8XV7tUprSirzK/cpx9Dt6
         Y1CCx97hRewXuLOkDXWzOUs2ULWQ95jVRrumFJxlFoWOJVh6munQR07jUHr1gk4FipMG
         Z0yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716449802; x=1717054602;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=buLlfSRbNSquiXb28kC99WB3SCtrZrj462yD9YsyZ9s=;
        b=ZV96iu+Cs23EnE0OgQAOohubEtmPnVvJCJPHq1a96dtBqF5W4+6TE5SeP0Hp0ssIe2
         VDyMXm9DQACWdUI0F+lUTFcsPS/mecrnSGQBMBgCRTSIrCPIl6SM0gyo+VvMtU3dawd1
         28oWfWoqpKXWBQfjrOor/m+ASLJz+Wl/72sO7oStqofKKRp1cEkTmg0QykPkfaex39Ft
         ZWFCXjANXSDYwtYcdr3JoeabTJK1MWBKQrdfaJlybN0Y5qJ6vBBQVioib2e7QtiTenRV
         hvNUzbavmKxpS5t5zUUvy0TCC7CLZpzDWqN0O38thqdDaJN3TDlWe0Hk77jaHtqHxc3F
         hrKA==
X-Gm-Message-State: AOJu0Yw7bHIZ6ZrBg5nkDvJdb/FTznt8ayI5GPkbc7ZG511CUziV8SyM
	GEr2fwXcWgNTeoSNZzNCY0lLEl0FDSryUhWgwFMiYsoVcHoPftptPm/ABbOhk9SgdhTEbgQs/eP
	nPfMMWssL58K/0pYLw3o2atuUjBo=
X-Google-Smtp-Source: AGHT+IFuMZxUt7fR0/q1+BM1zkULdvECQwbMoNM0vLA5hGJYwne05Om6c/SJgVwCaQhzCMzwQoAZIs2FSWZ4AXcLBH4=
X-Received: by 2002:a2e:99d9:0:b0:2e1:d48e:d5b2 with SMTP id
 38308e7fff4ca-2e951c21a51mr4261141fa.22.1716449801782; Thu, 23 May 2024
 00:36:41 -0700 (PDT)
MIME-Version: 1.0
References: <20240523073938.2135-1-marcus.folkesson@gmail.com>
In-Reply-To: <20240523073938.2135-1-marcus.folkesson@gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 23 May 2024 09:36:30 +0200
Message-ID: <CANNYZj_PsT8HBLeH51O_9jDTcLmcKx3Sfk=M8GKu898AV+Zw+Q@mail.gmail.com>
Subject: Re: [docs] [PATCH 1/2] image-bootfiles.bbclass: new class, copy boot
 files to /boot on rfs
To: marcus.folkesson@gmail.com
Cc: docs@lists.yoctoproject.org
Content-Type: multipart/alternative; boundary="000000000000b5ce1f06191a1cae"
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 23 May 2024 07:36:49 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5229

--000000000000b5ce1f06191a1cae
Content-Type: text/plain; charset="UTF-8"

Wrong mailing list. Also why not install these from regular packages?

Alex

On Thu 23. May 2024 at 9.33, Marcus Folkesson via lists.yoctoproject.org
<marcus.folkesson=gmail.com@lists.yoctoproject.org> wrote:

> image-bootfiles class copy files listed IMAGE_BOOT_FILES
> to the /boot directory of the root filesystem.
>
> This is useful when there is no explicit boot partition but all boot
> files should instead reside inside the root filesystem.
>
> Signed-off-by: Marcus Folkesson <marcus.folkesson@gmail.com>
> ---
>  meta/classes/image-bootfiles.bbclass | 69 ++++++++++++++++++++++++++++
>  1 file changed, 69 insertions(+)
>  create mode 100644 meta/classes/image-bootfiles.bbclass
>
> diff --git a/meta/classes/image-bootfiles.bbclass
> b/meta/classes/image-bootfiles.bbclass
> new file mode 100644
> index 0000000000..850e14e4bb
> --- /dev/null
> +++ b/meta/classes/image-bootfiles.bbclass
> @@ -0,0 +1,69 @@
> +#
> +# Writes IMAGE_BOOT_FILES to the /boot directory
> +#
> +# Copyright (C) 2024 Marcus Folkesson
> +# Author: Marcus Folkesson <marcus.folkesson@gmail.com>
> +#
> +# Licensed under the MIT license, see COPYING.MIT for details
> +# Inspired of bootimg-partition.py
> +#
> +# Usage: add INHERIT += "image-bootfiles" to your conf file
> +#
> +
> +def bootfiles_populate(d):
> +    import re
> +    from glob import glob
> +    import shutil
> +
> +    boot_files = d.getVar("IMAGE_BOOT_FILES")
> +    deploy_image_dir = d.getVar("DEPLOY_DIR_IMAGE")
> +    boot_dir = d.getVar("IMAGE_ROOTFS") + "/boot"
> +    install_files = []
> +
> +    if boot_files is None:
> +        return
> +
> +    # list of tuples (src_name, dst_name)
> +    deploy_files = []
> +    for src_entry in re.findall(r'[\w;\-\./\*]+', boot_files):
> +        if ';' in src_entry:
> +            dst_entry = tuple(src_entry.split(';'))
> +            if not dst_entry[0] or not dst_entry[1]:
> +                raise bb.parse.SkipRecipe('Malformed boot file entry: %s'
> % src_entry)
> +        else:
> +            dst_entry = (src_entry, src_entry)
> +
> +        deploy_files.append(dst_entry)
> +
> +    for deploy_entry in deploy_files:
> +        src, dst = deploy_entry
> +        if '*' in src:
> +            # by default install files under their basename
> +            entry_name_fn = os.path.basename
> +            if dst != src:
> +                # unless a target name was given, then treat name
> +                # as a directory and append a basename
> +                entry_name_fn = lambda name: \
> +                                os.path.join(dst,
> +                                             os.path.basename(name))
> +
> +
> +                srcs = glob(os.path.join(deploy_image_dir, src))
> +                for entry in srcs:
> +                    src = os.path.relpath(entry, deploy_mage_dir)
> +                    entry_dst_name = entry_name_fn(entry)
> +                    install_files.append((src, entry_dst_name))
> +            else:
> +                install_files.append((src, dst))
> +
> +    for entry in install_files:
> +        src, dst = entry
> +        image_src = os.path.join(deploy_image_dir, src)
> +        image_dst = os.path.join(boot_dir, dst)
> +        shutil.copyfile(image_src, image_dst)
> +
> +python bootfiles () {
> +   bootfiles_populate(d),
> +}
> +
> +IMAGE_PREPROCESS_COMMAND += "bootfiles;"
> --
> 2.44.0
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#5227):
> https://lists.yoctoproject.org/g/docs/message/5227
> Mute This Topic: https://lists.yoctoproject.org/mt/106258620/1686489
> Group Owner: docs+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/docs/unsub [
> alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>
>

--000000000000b5ce1f06191a1cae
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Wrong mailing list. Also why not install these from regul=
ar packages?</div><div dir=3D"auto"><br></div><div dir=3D"auto">Alex</div><=
div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On=
 Thu 23. May 2024 at 9.33, Marcus Folkesson via <a href=3D"http://lists.yoc=
toproject.org">lists.yoctoproject.org</a> &lt;marcus.folkesson=3D<a href=3D=
"mailto:gmail.com@lists.yoctoproject.org">gmail.com@lists.yoctoproject.org<=
/a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0=
px 0px 0px 0.8ex;border-left-width:1px;border-left-style:solid;padding-left=
:1ex;border-left-color:rgb(204,204,204)">image-bootfiles class copy files l=
isted IMAGE_BOOT_FILES<br>
to the /boot directory of the root filesystem.<br>
<br>
This is useful when there is no explicit boot partition but all boot<br>
files should instead reside inside the root filesystem.<br>
<br>
Signed-off-by: Marcus Folkesson &lt;<a href=3D"mailto:marcus.folkesson@gmai=
l.com" target=3D"_blank">marcus.folkesson@gmail.com</a>&gt;<br>
---<br>
=C2=A0meta/classes/image-bootfiles.bbclass | 69 +++++++++++++++++++++++++++=
+<br>
=C2=A01 file changed, 69 insertions(+)<br>
=C2=A0create mode 100644 meta/classes/image-bootfiles.bbclass<br>
<br>
diff --git a/meta/classes/image-bootfiles.bbclass b/meta/classes/image-boot=
files.bbclass<br>
new file mode 100644<br>
index 0000000000..850e14e4bb<br>
--- /dev/null<br>
+++ b/meta/classes/image-bootfiles.bbclass<br>
@@ -0,0 +1,69 @@<br>
+#<br>
+# Writes IMAGE_BOOT_FILES to the /boot directory<br>
+#<br>
+# Copyright (C) 2024 Marcus Folkesson<br>
+# Author: Marcus Folkesson &lt;<a href=3D"mailto:marcus.folkesson@gmail.co=
m" target=3D"_blank">marcus.folkesson@gmail.com</a>&gt;<br>
+#<br>
+# Licensed under the MIT license, see COPYING.MIT for details<br>
+# Inspired of bootimg-partition.py<br>
+#<br>
+# Usage: add INHERIT +=3D &quot;image-bootfiles&quot; to your conf file<br=
>
+#<br>
+<br>
+def bootfiles_populate(d):<br>
+=C2=A0 =C2=A0 import re<br>
+=C2=A0 =C2=A0 from glob import glob<br>
+=C2=A0 =C2=A0 import shutil<br>
+<br>
+=C2=A0 =C2=A0 boot_files =3D d.getVar(&quot;IMAGE_BOOT_FILES&quot;)<br>
+=C2=A0 =C2=A0 deploy_image_dir =3D d.getVar(&quot;DEPLOY_DIR_IMAGE&quot;)<=
br>
+=C2=A0 =C2=A0 boot_dir =3D d.getVar(&quot;IMAGE_ROOTFS&quot;) + &quot;/boo=
t&quot;<br>
+=C2=A0 =C2=A0 install_files =3D []<br>
+<br>
+=C2=A0 =C2=A0 if boot_files is None:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return<br>
+<br>
+=C2=A0 =C2=A0 # list of tuples (src_name, dst_name)<br>
+=C2=A0 =C2=A0 deploy_files =3D []<br>
+=C2=A0 =C2=A0 for src_entry in re.findall(r&#39;[\w;\-\./\*]+&#39;, boot_f=
iles):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if &#39;;&#39; in src_entry:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dst_entry =3D tuple(src_entry.sp=
lit(&#39;;&#39;))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if not dst_entry[0] or not dst_e=
ntry[1]:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 raise bb.parse.Ski=
pRecipe(&#39;Malformed boot file entry: %s&#39; % src_entry)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 else:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dst_entry =3D (src_entry, src_en=
try)<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 deploy_files.append(dst_entry)<br>
+<br>
+=C2=A0 =C2=A0 for deploy_entry in deploy_files:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 src, dst =3D deploy_entry<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if &#39;*&#39; in src:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # by default install files under=
 their basename<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 entry_name_fn =3D os.path.basena=
me<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if dst !=3D src:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # unless a target =
name was given, then treat name<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # as a directory a=
nd append a basename<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 entry_name_fn =3D =
lambda name: \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 os.path.join(dst,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0os.path.basename(name))<br>
+<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 srcs =3D glob(os.p=
ath.join(deploy_image_dir, src))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 for entry in srcs:=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 src =
=3D os.path.relpath(entry, deploy_mage_dir)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 entr=
y_dst_name =3D entry_name_fn(entry)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 inst=
all_files.append((src, entry_dst_name))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 else:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 install_files.appe=
nd((src, dst))<br>
+<br>
+=C2=A0 =C2=A0 for entry in install_files:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 src, dst =3D entry<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 image_src =3D os.path.join(deploy_image_dir, s=
rc)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 image_dst =3D os.path.join(boot_dir, dst)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 shutil.copyfile(image_src, image_dst)<br>
+<br>
+python bootfiles () {<br>
+=C2=A0 =C2=A0bootfiles_populate(d),<br>
+}<br>
+<br>
+IMAGE_PREPROCESS_COMMAND +=3D &quot;bootfiles;&quot;<br>
-- <br>
2.44.0<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#5227): <a href=3D"https://lists.yoctoproject.org/g/docs=
/message/5227" rel=3D"noreferrer" target=3D"_blank">https://lists.yoctoproj=
ect.org/g/docs/message/5227</a><br>
Mute This Topic: <a href=3D"https://lists.yoctoproject.org/mt/106258620/168=
6489" rel=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.org/m=
t/106258620/1686489</a><br>
Group Owner: <a href=3D"mailto:docs%2Bowner@lists.yoctoproject.org" target=
=3D"_blank">docs+owner@lists.yoctoproject.org</a><br>
Unsubscribe: <a href=3D"https://lists.yoctoproject.org/g/docs/unsub" rel=3D=
"noreferrer" target=3D"_blank">https://lists.yoctoproject.org/g/docs/unsub<=
/a> [<a href=3D"mailto:alex.kanavin@gmail.com" target=3D"_blank">alex.kanav=
in@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div></div>

--000000000000b5ce1f06191a1cae--

