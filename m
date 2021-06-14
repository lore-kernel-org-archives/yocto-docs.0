Received: from mx1.emlix.com (mx1.emlix.com [136.243.223.33])
 by mx.groups.io with SMTP id smtpd.web09.26279.1623648617278441140
 for <docs@lists.yoctoproject.org>;
 Sun, 13 Jun 2021 22:30:18 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: emlix.com, ip: 136.243.223.33, mailfrom: dwagenknecht@emlix.com)
Received: from mailer.emlix.com (unknown [81.20.119.6])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.emlix.com (Postfix) with ESMTPS id A24DE5F9C1;
	Mon, 14 Jun 2021 07:30:14 +0200 (CEST)
From: "Daniel Wagenknecht" <dwagenknecht@emlix.com>
To: docs@lists.yoctoproject.org
Cc: "Quentin Schulz" <quentin.schulz@streamunlimited.com>
Subject: [PATCH 0/2] Fixups for glossary
Date: Mon, 14 Jun 2021 07:30:11 +0200
Message-Id: <20210614053013.68669-1-dwagenknecht@emlix.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: 20210611172040.j7p3l6mln2mnfqss@qschulz
References: 
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Did some fixups as suggested by Quentin.

On Fri, 2021-06-11 at 19:20 +0200, Quentin Schulz wrote:
> >           IMAGE_CMD_jffs2 =3D "mkfs.jffs2 --root=3D${IMAGE_ROOTFS} \
> > -             --faketime --output=3D${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}=
.rootfs.jffs2 \
> > +             --faketime --output=3D${IMGDEPLOYDIR}/${IMAGE_NAME}.roo=
tfs.jffs2 \
> >               ${EXTRA_IMAGECMD}"
>=20
> It'd be awesome if you could do a follow-up patch here since this isn't=
 the actual
> content of this variable anymore.
done

> IMAGE_MANIFEST isn't in this class anymore, it'd be great again if you
> could send a follow-up patch for this.
done

> On a side note: you should have added the term in the glossary (from pa=
tch 2)
> first, because technically this commit does not build.
will keep in mind next time.

Thanks for taking a thorough look at the changes and what was still
missing. Great work you are all doing with the documentation!

Best Wishes
  Daniel

Daniel Wagenknecht (2):
  ref-manual: variables: fixup example in IMAGE_CMD
  ref-manual: variables: fixup class reference in IMAGE_MANIFEST

 documentation/ref-manual/variables.rst | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

--=20
2.25.1

