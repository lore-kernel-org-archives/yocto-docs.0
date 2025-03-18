Return-Path: <rybczynska@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2DF4C282EC
	for <webhook@archiver.kernel.org>; Tue, 18 Mar 2025 06:51:12 +0000 (UTC)
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
 by mx.groups.io with SMTP id smtpd.web11.5685.1742280667725455160
 for <docs@lists.yoctoproject.org>;
 Mon, 17 Mar 2025 23:51:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=chsh6Epy;
 spf=pass (domain: gmail.com, ip: 209.85.216.45, mailfrom: rybczynska@gmail.com)
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-2ff64550991so3535679a91.0
        for <docs@lists.yoctoproject.org>; Mon, 17 Mar 2025 23:51:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742280667; x=1742885467; darn=lists.yoctoproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=bnnajyPybxxbHQsjy7bIFJc1TEWujGsVRWvVwfj/lKQ=;
        b=chsh6EpylF3w0Vpk7LWHATB3+A9QEWk2V9YRJn8YuhH3ydOfLr1yMQron/Ljpus2Ak
         Xwl0Ne6AChruNuxX0QTUWlwT75rkkliXaTLS4qezQm+aJr99oFP8fSiqP0J5bGXraVTU
         FWESZ8wYNpdAIvup3HXB9bC+6Oe/+qvIMrr7OEDlllz8xpC13K4TCIETbsbIXPTW8VlX
         STOyNQBGUzRDc64bUw98baZ5bawqIBNk3lzU3H4CUnYf1nljVpqN8xA9KgKSFdQt0O3y
         9Jh+CF9lCnuWo84yalEsSR2Dn5aFXx69Cacq/S13oU3blb9LYQx8oy3eIWqdTjkoWCBT
         jSlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742280667; x=1742885467;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bnnajyPybxxbHQsjy7bIFJc1TEWujGsVRWvVwfj/lKQ=;
        b=M/bfPWqcoWbmxP64LDcKtL4A/mtSiw7rPu7ezuMbTMZuzEDbKOJegPE4XOahwDRai8
         awJzZ4Ost2lO6D0IebLawzRaLStsTueISz60k3bfjkfTHZMZsmCd9Z0N2SUh/eDrgLdW
         3c/FBAlc8ZoLw24oPMivUEFOq+iIJ50a7MDHNhaCfsa9qDd8I3CApu63IgiNJuUN/dwQ
         x9SCdUp/fZtgxTBsVNenDrzZgg2oLCRwCx3BW/2fbu1f6SAf/tjvwuLRRF7jpQTi/UFh
         eq7VOPGL0uKLCaXSkgGMIpI2PQt+6aLZAEoy2NYY/fXggUpegvWQnyppXd25Tt7h4TRL
         zehw==
X-Gm-Message-State: AOJu0YyaC5w4yW2OMu9n1uVNipupm/hSGhMvRFjX04Fctfm7zM8eYOpd
	9Dj1YLcYsOKwafDAGRKC2RXpqNAKDN5jcOSXGjfXJKMfe5dRSZPpXlkE8F177zg9Wcku8wzTLeD
	JBnyFHyCY81AiX9vqSzERcYZYd8k=
X-Gm-Gg: ASbGncshdYFq/dawdjXUD+x75t37b/ss0maLnZZWT2HJLMicYIeU2/ZnTJCVDXrAE/G
	PP3aUDwgnXLbg35geuUaneJqQoZs6/iZNa1y5kLryJ6r2o5EUTJvfCkQGilnMkDVbDVFtf97NNB
	mHwm030UwsGTtGAo/uWSFTITdMe3BE
X-Google-Smtp-Source: AGHT+IFqOzs/K7uX+LsqdvdA3333IyP99OxtrFPiVwARnNrOrAEwb/CrocZsMOMRyjhqsQMne+01HAjYkdzQeQC8Ucw=
X-Received: by 2002:a17:90b:1b45:b0:2fe:b8ba:62e1 with SMTP id
 98e67ed59e1d1-301a5b882a9mr1605904a91.28.1742280667009; Mon, 17 Mar 2025
 23:51:07 -0700 (PDT)
MIME-Version: 1.0
References: <20250317-release-note-5-2-updates-v1-0-82b0a4182aff@bootlin.com> <20250317-release-note-5-2-updates-v1-11-82b0a4182aff@bootlin.com>
In-Reply-To: <20250317-release-note-5-2-updates-v1-11-82b0a4182aff@bootlin.com>
From: Marta Rybczynska <rybczynska@gmail.com>
Date: Tue, 18 Mar 2025 07:50:55 +0100
X-Gm-Features: AQ5f1JrQDSIDffbfJjoCoRrliLb1_WuFAfXz-vg8NN7eaH64qHWOrLgeyDTDWaU
Message-ID: <CAApg2=Ro3uY7tFWHGgLuuEacrXyFTZET4CL6emPaViviFLqQwQ@mail.gmail.com>
Subject: Re: [docs] [PATCH 11/11] migration-guides/release-notes-5.2: update
 for upcoming 5.2 release
To: antonin.godard@bootlin.com
Cc: docs@lists.yoctoproject.org, 
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: multipart/alternative; boundary="0000000000004198c4063098540f"
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 18 Mar 2025 06:51:12 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6588

--0000000000004198c4063098540f
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 17, 2025 at 10:06=E2=80=AFAM Antonin Godard via lists.yoctoproj=
ect.org
<antonin.godard=3Dbootlin.com@lists.yoctoproject.org> wrote:

>
>
> +   -  The ``cve-update-db-native`` was restored from kirkstone and can b=
e
> used
> +      to update the CVE National Vulnerability Database (NVD). Add
> support for
> +      the FKIE-CAD (https://github.com/fkie-cad/nvd-json-data-feeds) CVE
> source
> +      for it.
> +
>

Could you add something like:

Users can control the NVD database source using the NVD_DB_VERSION variable
with possible
values NVD1, NVD2, or FKIE.

Kind regards,
Marta

--0000000000004198c4063098540f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, Mar 17,=
 2025 at 10:06=E2=80=AFAM Antonin Godard via <a href=3D"http://lists.yoctop=
roject.org">lists.yoctoproject.org</a> &lt;antonin.godard=3D<a href=3D"mail=
to:bootlin.com@lists.yoctoproject.org">bootlin.com@lists.yoctoproject.org</=
a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0p=
x 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><b=
r>
<br>
+=C2=A0 =C2=A0-=C2=A0 The ``cve-update-db-native`` was restored from kirkst=
one and can be used<br>
+=C2=A0 =C2=A0 =C2=A0 to update the CVE National Vulnerability Database (NV=
D). Add support for<br>
+=C2=A0 =C2=A0 =C2=A0 the FKIE-CAD (<a href=3D"https://github.com/fkie-cad/=
nvd-json-data-feeds" rel=3D"noreferrer" target=3D"_blank">https://github.co=
m/fkie-cad/nvd-json-data-feeds</a>) CVE source<br>
+=C2=A0 =C2=A0 =C2=A0 for it.<br>
+<br></blockquote><div><br></div><div>Could you add something like:<br></di=
v><div><br></div><div>Users can control the NVD database source using the <=
span style=3D"font-family:monospace"><span style=3D"color:rgb(0,0,0);backgr=
ound-color:rgb(255,255,255)">NVD_DB_VERSION variable with possible</span></=
span></div><div><span style=3D"font-family:monospace"><span style=3D"color:=
rgb(0,0,0);background-color:rgb(255,255,255)">values </span></span><span st=
yle=3D"font-family:monospace"><span style=3D"font-weight:bold;color:rgb(255=
,84,84);background-color:rgb(255,255,255)">NVD1</span><span style=3D"color:=
rgb(0,0,0);background-color:rgb(255,255,255)">, NVD2, or FKIE</span>.<br></=
span></div><div>=C2=A0</div><div>Kind regards,</div><div>Marta<br></div></d=
iv></div>

--0000000000004198c4063098540f--

