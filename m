Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.web08.215.1623080185397282695
 for <docs@lists.yoctoproject.org>;
 Mon, 07 Jun 2021 08:36:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=KiSDhpKH;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.41, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f41.google.com with SMTP id m18so18146154wrv.2
        for <docs@lists.yoctoproject.org>; Mon, 07 Jun 2021 08:36:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:references:user-agent:mime-version;
        bh=rjUVn1TgD5zQeLYAjbqtzDLC1HSp+m9quFgChQ3fqnI=;
        b=KiSDhpKHl68utBlS07+nkTf+yvA/JOb4wvYGsDGB4V/3dXQ7Msz3MnXo/7Q/MrlLnr
         6W/KQ173qmrHZzZYf85htgABW42O8rXuHn/xt8y/vc6DngQAOEsBVElOdd6kAShHXSvv
         3BrJk3QILIk/mpTrjTDqTq2GlMdvawEws7AlQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:references
         :user-agent:mime-version;
        bh=rjUVn1TgD5zQeLYAjbqtzDLC1HSp+m9quFgChQ3fqnI=;
        b=bFR/Ot4yurgwmbT6Ou+4Y5rCpIXclVNgiw4bulLSyx0bjNkCgwivwGzhzF+I0ct0JU
         F5BIuzI8rS4MP96udXeL9Mi5BnsrOG+/O5mGivvw4/PcvnVgxx0pwk1WC08zo/vUIeQ+
         5Du2sefjW9CyXDNM09Oi2pz5ExwpTOAoaC55+3V4dQDALdv1s78qKAKTejXZod1zds1B
         1ftzA6n7J+TbllnIvLn3wUDPZtl2fwAEmrLTOMWSb4+2RupsDJa4h567mYfBhym0jAcK
         NqUx/tCaZDe+8nBgL5aHM4bOIz0g8IDivQZsKbxwipiqwfrE7UnbYSmQEQgz0moLsFJZ
         t/Ww==
X-Gm-Message-State: AOAM530MVR+8PQ5tI2fqHHyExfGTYdl3Y12BNRNJociodKIkC4jvQnD2
	EcEtqHgP6TF1LSJrSXdXBs9sowJQryJH8Q==
X-Google-Smtp-Source: ABdhPJxjf3N+YZGrT/JNbyUW3jnbkCKSkhxWqozrvLEsVsJregE8sJfyxwRI8cqOUmvHXiJKyxTyuQ==
X-Received: by 2002:adf:f708:: with SMTP id r8mr18144797wrp.159.1623080183640;
        Mon, 07 Jun 2021 08:36:23 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:bc28:bf5c:88f3:2d27? ([2001:8b0:aba:5f3c:bc28:bf5c:88f3:2d27])
        by smtp.gmail.com with ESMTPSA id g17sm2431375wrh.72.2021.06.07.08.36.23
        for <docs@lists.yoctoproject.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Jun 2021 08:36:23 -0700 (PDT)
Message-ID: <3c7b1f74d4b989316e24be08db75f34720198e2d.camel@linuxfoundation.org>
Subject: [poky] [PATCH] README.poky: Update to switch to markdown format and update
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: docs <docs@lists.yoctoproject.org>
Date: Mon, 07 Jun 2021 16:36:22 +0100
References: <16865661A55682C8.7118@lists.yoctoproject.org>
User-Agent: Evolution 3.40.0-1 
MIME-Version: 1.0
X-Groupsio-MsgNum: 1391
Content-Type: multipart/mixed; boundary="=-mDwcSLoKyI/AlKaPStjV"

--=-mDwcSLoKyI/AlKaPStjV
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Mentioning on the docs list.

I a plan is forming to migrate the various READMEs in the repos to markdown
format and display these in the git web interface in the about page. If this
merges I'll work with MichaelH to make sure it displays properly on the
about page.

I've had a go at improving the poky one which needed a bit of modernisation
anyway. Help with others welcome.

I am a little torn on this as it does make the README harder to read
outside of rendered interfaces.

Cheers,

Richard

--=-mDwcSLoKyI/AlKaPStjV
Content-Disposition: inline
Content-Description: Forwarded message =?UTF-8?Q?=E2=80=94?= [poky] [PATCH]
 README.poky: Update to switch to markdown format and update
Content-Type: message/rfc822

Return-Path: <richard.purdie+caf_=rpurdie=rpsys.net@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on dan.rpsys.net
X-Spam-Level: 
X-Spam-Status: No, score=-3.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FUZZY_CPILL,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.4
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com
 [209.85.221.42]) by dan.rpsys.net (8.15.2/8.15.2/Debian-18) with ESMTPS id
 157FUwsp1612385 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128
 verify=NOT) for <rpurdie@rpsys.net>; Mon, 7 Jun 2021 16:30:59 +0100
Authentication-Results: dan.rpsys.net; dkim=pass (1024-bit key;
 unprotected) header.d=lists.yoctoproject.org
 header.i=@lists.yoctoproject.org header.a=rsa-sha256 header.s=20140610
 header.b=S8Qiw8v/; dkim-atps=neutral
Received: by mail-wr1-f42.google.com with SMTP id f2so18075741wri.11
        for <rpurdie@rpsys.net>; Mon, 07 Jun 2021 08:30:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=1e100.net;
 s=20161025;
 h=x-gm-message-state:delivered-to:from:to:subject:date:message-id
 :mime-version:precedence:list-unsubscribe:list-subscribe:list-help
 :sender:list-id:mailing-list:delivered-to:list-post:reply-to
 :dkim-signature; bh=5Clawu0nlzBf+gU8W2vWRk2i7bNLrvAjc2RYI3U1+FA=;
 b=U8FybORN6zUQyhTRiUfdxjMvE70HyHmlkrxC0PknyzLhl+IFUZquYnNy/mituLbzJK
 o3OjzR5N3W8+gxYdyADBYHXiFcB9xfemVWTid9XsQPJCLNFRXQBPwCvnlLji3DqbyJKv
 BEXpoV5RT8XRMAt6GO12Ho3giOdF66d4+IlPUVu+vy+pRWMPYlcZG8CfsTj84m+RLXia
 E8UdUqa2CBacejs+qT+Se7+Onk9TGRQhzvi2deHscRhcz5+jwtCh0vT8XY0GpVzFQehx
 fUfZItSIiurKlRKAG43EOlPUqqgjlMgGIX76w4uEQW0UXfUqwNL7yO5chxMdA9vMpyWr M/Uw==
X-Gm-Message-State:
 AOAM532VCYsOywxPaOql308BqtoAHO6G/EByYljzDWUQjVq6PgEttfpj
 YtkOuZC8uGuU6SXrz52OBAzO/6pQjawHcuJjXywVcYX3y+YmGACx+qMl
X-Received: by 2002:adf:f305:: with SMTP id
 i5mr18464755wro.29.1623079853308; Mon, 07 Jun 2021 08:30:53 -0700 (PDT)
X-Forwarded-To: rpurdie@rpsys.net
X-Forwarded-For: richard.purdie@linuxfoundation.org rpurdie@rpsys.net
Delivered-To: richard.purdie@linuxfoundation.org
Received: by 2002:adf:eec8:0:0:0:0:0 with SMTP id a8csp3389580wrp;
        Mon, 7 Jun 2021 08:30:50 -0700 (PDT)
X-Google-Smtp-Source:
 ABdhPJyFLz3mZS4441aKmY90Bk9AzESx8IUCdBLQNTLwP83TcsHf3wN2eTayFemDU1iYc7eTS3OS
X-Received: by 2002:a62:5c87:0:b029:2ed:cf:1f89 with SMTP id
 q129-20020a625c870000b02902ed00cf1f89mr11035388pfb.9.1623079850201; Mon, 07
 Jun 2021 08:30:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1623079850; cv=none; d=google.com;
 s=arc-20160816;
 b=OZDByL0vbt4xMm/UTeZo/4Lt9PXBl8vxa9S1st2fipaLsntRBIlScXLh7EoSHWYrkt
 HdqtdMygsgeG5zSVXAAlA3kAASgEUiU0x7L5eJPOedaU+emO6Ilv+DVqGUiThPms0zJ2
 3RQmoBV+byXo0bsfFMKRjnFInZ9FBjlf2D8o3j2r/wIs2c9UsYu3bdj4SQ+F+/FPypO0
 Ypd/n5uRQ+psi+P9CN4Z3+Zs2EUFAZVRaF2d5yQjzgQD77FGuO8EcsqAK87Pq+W48U9P
 kdiPvyH59z0AvRLUdjkVHPqKCaEuAKTedeI+OA08sFQ96ZzKArmBHW68KeRttF8jYJRW VOHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20160816;
 h=dkim-signature:reply-to:list-post:delivered-to:mailing-list:list-id
 :sender:list-help:list-subscribe:list-unsubscribe:precedence
 :mime-version:message-id:date:subject:to:from;
 bh=5Clawu0nlzBf+gU8W2vWRk2i7bNLrvAjc2RYI3U1+FA=;
 b=dcwJO0g8dWmzNKU4Z49vZ0+z/Ptd5Kv90SRCOVP5PD8yNhAWUMqKeUqzxbRljypVpu
 O1O55ER73C31eDu4BxG1iRQvQ3WPxpVm27C7usXJdMnlHhfdpwCTIUWLIMTCgZP/5mfD
 TeaSuT600ef8tsWE61VWe3eJkufZ10HsSU5PiZro97ArbQrEPrbjhBOURaeElyELTwOR
 ghIx6R6jeXos+sxESwiSF7qQsZJy7WrFnp5JG5GOfaf/3sz0pWubc+8aUWhFxxmX1Zhj
 DsXh62fwXoxE6Kehue2YBrSVDVPWOGx829TzZW8hLF6uVfmvy8dYcpT5JxKTsPeD5QpD WZCg==
ARC-Authentication-Results: i=1; mx.google.com; dkim=pass
 header.i=@lists.yoctoproject.org header.s=20140610 header.b="S8Qiw8v/";
 spf=pass (google.com: domain of
 bounce+53638+12461+1686473+6694428@lists.yoctoproject.org designates
 66.175.222.108 as permitted sender)
 smtp.mailfrom=bounce+53638+12461+1686473+6694428@lists.yoctoproject.org;
 dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=yoctoproject.org
Received: from mail02.groups.io (mail02.groups.io. [66.175.222.108]) by
 mx.google.com with ESMTPS id c5si12858174pfv.309.2021.06.07.08.30.49 for
 <richard.purdie@linuxfoundation.org> (version=TLS1_3
 cipher=TLS_AES_128_GCM_SHA256 bits=128/128); Mon, 07 Jun 2021 08:30:50
 -0700 (PDT)
Received-SPF: pass (google.com: domain of
 bounce+53638+12461+1686473+6694428@lists.yoctoproject.org designates
 66.175.222.108 as permitted sender) client-ip=66.175.222.108;
Authentication-Results: mx.google.com; dkim=pass
 header.i=@lists.yoctoproject.org header.s=20140610 header.b="S8Qiw8v/";
 spf=pass (google.com: domain of
 bounce+53638+12461+1686473+6694428@lists.yoctoproject.org designates
 66.175.222.108 as permitted sender)
 smtp.mailfrom=bounce+53638+12461+1686473+6694428@lists.yoctoproject.org;
 dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=yoctoproject.org
X-Received: by 127.0.0.2 with SMTP id LHswYY1687808xlEsdblGfzP; Mon, 07 Jun
 2021 08:30:49 -0700
X-Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com
 [209.85.128.48]) by mx.groups.io with SMTP id
 smtpd.web10.97.1623079692561042976 for <poky@lists.yoctoproject.org>; Mon,
 07 Jun 2021 08:28:12 -0700
X-Received: by mail-wm1-f48.google.com with SMTP id g204so10295550wmf.5 for
 <poky@lists.yoctoproject.org>; Mon, 07 Jun 2021 08:28:12 -0700 (PDT)
X-Received: by 2002:a1c:9807:: with SMTP id
 a7mr17200053wme.10.1623079690809; Mon, 07 Jun 2021 08:28:10 -0700 (PDT)
X-Received: from hex.int.rpsys.net
 ([2001:8b0:aba:5f3c:bc28:bf5c:88f3:2d27]) by smtp.gmail.com with ESMTPSA id
 b8sm14489356wmd.35.2021.06.07.08.28.10 for <poky@lists.yoctoproject.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256); Mon, 07 Jun
 2021 08:28:10 -0700 (PDT)
From: "Richard Purdie via lists.yoctoproject.org" <richard.purdie=linuxfoundation.org@lists.yoctoproject.org>
To: poky@lists.yoctoproject.org
Subject: [poky] [PATCH] README.poky: Update to switch to markdown format
 and update
Date: Mon,  7 Jun 2021 16:28:09 +0100
Message-Id: <16865661A55682C8.7118@lists.yoctoproject.org>
MIME-Version: 1.0
Precedence: Bulk
List-Unsubscribe: <mailto:poky+unsubscribe@lists.yoctoproject.org>
List-Subscribe: <mailto:poky+subscribe@lists.yoctoproject.org>
List-Help: <mailto:poky+help@lists.yoctoproject.org>
Sender: poky@lists.yoctoproject.org
List-Id: <poky.lists.yoctoproject.org>
Mailing-List: list poky@lists.yoctoproject.org; contact
 poky+owner@lists.yoctoproject.org
Delivered-To: mailing list poky@lists.yoctoproject.org
List-Post: <mailto:poky@lists.yoctoproject.org>
X-Orig-Message-Id:
 <20210607152809.3071859-1-richard.purdie@linuxfoundation.org>
Reply-To: richard.purdie@linuxfoundation.org
Content-Type: multipart/mixed; boundary="9p16iUBzygmJ8fKfI3mj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=lists.yoctoproject.org; q=dns/txt; s=20140610; t=1623079849;
 bh=CDOi0gAH1maS/S2GkDMu4XSbPav4uN+fRSRcyetJqLs=;
 h=Content-Type:Date:From:Reply-To:Subject:To;
 b=S8Qiw8v/g8/pcb3gxsvWHqTg/xj3ZHO/Ko23fwDUcvPEcBLCYsw/tactvTBIwBEmdd5
 cQ5Xpb3z7oO6B66vuLIeUCSH2KF4+zLPvGxAFGtuluq0a1tspniDku41n/CNsMgtU8dCf
 3fcpsVl8LT/ALeoxz4/sSz0ydp3RbcoiJkE=
X-Virus-Scanned: clamav-milter 0.102.3 at dan
X-Virus-Status: Clean


--9p16iUBzygmJ8fKfI3mj
Content-Transfer-Encoding: quoted-printable

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 README.poky =3D> README.poky.md |  0
 meta-poky/README.poky         | 77 ++++++++++++++---------------------
 2 files changed, 30 insertions(+), 47 deletions(-)
 rename README.poky =3D> README.poky.md (100%)

diff --git a/README.poky b/README.poky.md
similarity index 100%
rename from README.poky
rename to README.poky.md
diff --git a/meta-poky/README.poky b/meta-poky/README.poky
index be0c6c016e0..02b46327094 100644
--- a/meta-poky/README.poky
+++ b/meta-poky/README.poky
@@ -1,35 +1,19 @@
-Poky
-=3D=3D=3D=3D
+#Poky
=20
-Poky is an integration of various components to form a complete prepackage=
d
-build system and development environment. It features support for building
-customised embedded device style images. There are reference demo images
-featuring a X11/Matchbox/GTK themed UI called Sato. The system supports
-cross-architecture application development using QEMU emulation and a
-standalone toolchain and SDK with IDE integration.
+Poky is an integration of various components to form pre-packaged build sy=
stem and development environment which is used as a development and validat=
ion tool by the [Yocto Project](http://www.yoctoproject.org/ "Yocto Project=
"). It features support for building customised embedded style device image=
s and custom containers. There are reference demo images ranging from X11/G=
TK+ to Weston, commandline and more. The system supports cross-architecture=
 application development using QEMU emulation and a standalone toolchain an=
d SDK suitable for IDE integration.
=20
-Additional information on the specifics of hardware that Poky supports
-is available in README.hardware. Further hardware support can easily be ad=
ded
-in the form of layers which extend the systems capabilities in a modular w=
ay.
+Additional information on the specifics of hardware that Poky supports is =
available in README.hardware. Further hardware support can easily be added =
in the form of BSP layers which extend the systems capabilities in a modula=
r way. Many layers are available and can be found through the [layer index]=
(https://layers.openembedded.org/ "layer index").
=20
-As an integration layer Poky consists of several upstream projects such as=
=20
-BitBake, OpenEmbedded-Core, Yocto documentation and various sources of inf=
ormation=20
-e.g. for the hardware support. Poky is in turn a component of the Yocto Pr=
oject.
+As an integration layer Poky consists of several upstream projects such as=
  [BitBake](https://git.openembedded.org/bitbake/ "BitBake"), [OpenEmbedded=
-Core](https://git.openembedded.org/openembedded-core/ "OpenEmbedded-Core")=
, [Yocto documentation](http://git.yoctoproject.org/cgit.cgi/yocto-docs/ "Y=
octo documentation"), the '[meta-yocto](http://git.yoctoproject.org/cgit.cg=
i/meta-yocto/ "meta-yocto")' layer which has configuration and hardware sup=
port components. These components are all part of the Yocto Project and Ope=
nEmbedded ecosystems.
=20
-The Yocto Project has extensive documentation about the system including a=
=20
-reference manual which can be found at:
-    http://yoctoproject.org/documentation
+The Yocto Project has extensive documentation about the system including a=
  reference manual which can be found at  https://docs.yoctoproject.org/
=20
-OpenEmbedded-Core is a layer containing the core metadata for current vers=
ions
-of OpenEmbedded. It is distro-less (can build a functional image with
-DISTRO =3D "") and contains only emulated machine support.
+OpenEmbedded is the build architecture used by Poky and the Yocto project.
+For information about OpenEmbedded, see the [OpenEmbedded website](http://=
www.openembedded.org/ "OpenEmbedded website").
=20
-For information about OpenEmbedded, see the OpenEmbedded website:
-    http://www.openembedded.org/
+#Contribution Guidelines
=20
-
-Contribution Guidelines
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+The project works using a mailing list patch submission process. Patches s=
hould be sent to the mailing list for the repository the components origina=
te from (see below). Throughout the Yocto Project, the README files in the =
component in question should detail where to send patches, who the maintain=
ers are and where bugs should be reported.
=20
 A guide to submitting patches to OpenEmbedded is available at:
=20
@@ -40,32 +24,31 @@ There is good documentation on how to write/format patc=
hes at:
 https://www.openembedded.org/wiki/Commit_Patch_Message_Guidelines
=20
=20
-Where to Send Patches
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+#Where to Send Patches
+
+As Poky is an integration repository (built using a tool called combo-laye=
r), patches against the various components should be sent to their respecti=
ve upstreams:
+
+OpenEmbedded-Core (files in meta/, meta-selftest/, meta-skeleton/, scripts=
/):
+
+- Git repository: https://git.openembedded.org/openembedded-core/
+-  Mailing list: openembedded-core@lists.openembedded.org
+
+BitBake (files in bitbake/):
+
+- Git repository: https://git.openembedded.org/bitbake/
+- Mailing list: bitbake-devel@lists.openembedded.org
=20
-As Poky is an integration repository (built using a tool called combo-laye=
r),
-patches against the various components should be sent to their respective
-upstreams:
+Documentation (files in documentation/):
=20
-bitbake:
-    Git repository: http://git.openembedded.org/bitbake/
-    Mailing list: bitbake-devel@lists.openembedded.org
+- Git repository: https://git.yoctoproject.org/cgit/cgit.cgi/yocto-docs/
+- Mailing list: docs@lists.yoctoproject.org
=20
-documentation:
-    Git repository: http://git.yoctoproject.org/cgit/cgit.cgi/yocto-docs/
-    Mailing list: docs@lists.yoctoproject.org
+meta-yocto (files in meta-poky/, meta-yocto-bsp/):
=20
-meta-poky, meta-yocto-bsp:
-    Git repository: http://git.yoctoproject.org/cgit/cgit.cgi/meta-yocto(-=
bsp)
-    Mailing list: poky@lists.yoctoproject.org
+- Git repository: http://git.yoctoproject.org/cgit/cgit.cgi/meta-yocto
+- Mailing list: poky@lists.yoctoproject.org
=20
-Everything else should be sent to the OpenEmbedded Core mailing list.  If =
in
-doubt, check the oe-core git repository for the content you intend to modi=
fy.
-Before sending, be sure the patches apply cleanly to the current oe-core g=
it
-repository.
+If in doubt, check the openembedded-core git repository for the content yo=
u intend to modify as most files are from there unless clearly one of the a=
bove categories. Before sending, be sure the patches apply cleanly to the c=
urrent git repository branch in question.
=20
-    Git repository: http://git.openembedded.org/openembedded-core/
-    Mailing list: openembedded-core@lists.openembedded.org
+[![CII Best Practices](https://bestpractices.coreinfrastructure.org/projec=
ts/765/badge)](https://bestpractices.coreinfrastructure.org/projects/765)
=20
-Note: The scripts directory should be treated with extra care as it is a m=
ix of
-oe-core and poky-specific files from meta-poky.
--=20
2.30.2

=0D
--9p16iUBzygmJ8fKfI3mj
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
Links: You receive all messages sent to this group.
View/Reply Online (#12461): https://lists.yoctoproject.org/g/poky/message/=
12461
Mute This Topic: https://lists.yoctoproject.org/mt/83372875/1686473
Group Owner: poky+owner@lists.yoctoproject.org
Unsubscribe: https://lists.yoctoproject.org/g/poky/unsub [richard.purdie@l=
inuxfoundation.org]
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-


--9p16iUBzygmJ8fKfI3mj--


--=-mDwcSLoKyI/AlKaPStjV--
