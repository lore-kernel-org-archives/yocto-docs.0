Received: from relay12.mail.gandi.net (relay12.mail.gandi.net [217.70.178.232])
 by mx.groups.io with SMTP id smtpd.web11.8627.1603890959018269103
 for <docs@lists.yoctoproject.org>;
 Wed, 28 Oct 2020 06:15:59 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: 0leil.net, ip: 217.70.178.232, mailfrom: foss@0leil.net)
Received: from [192.168.13.190] (80-110-109-234.cgn.dynamic.surfer.at [80.110.109.234])
	(Authenticated sender: foss@0leil.net)
	by relay12.mail.gandi.net (Postfix) with ESMTPSA id DAA92200005;
	Wed, 28 Oct 2020 13:15:55 +0000 (UTC)
Date: Wed, 28 Oct 2020 14:15:53 +0100
In-Reply-To: <20201028112952.172577-1-richard.purdie@linuxfoundation.org>
References: <20201028112952.172577-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Subject: Re: [docs] [PATCH] ref-manual/ref: Add entry for why binaries are changed in images
To: docs@lists.yoctoproject.org,Richard Purdie <richard.purdie@linuxfoundation.org>
From: "Quentin Schulz" <foss@0leil.net>
Message-ID: <D2630D40-E5E6-43CB-AEDA-C39318D2D349@0leil.net>
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi Richard,

On October 28, 2020 12:29:52 PM GMT+01:00, Richard Purdie <richard=2Epurdi=
e@linuxfoundation=2Eorg> wrote:
>Signed-off-by: Richard Purdie <richard=2Epurdie@linuxfoundation=2Eorg>
>---
> documentation/ref-manual/faq=2Erst | 11 +++++++++++
> 1 file changed, 11 insertions(+)
>
>diff --git a/documentation/ref-manual/faq=2Erst
>b/documentation/ref-manual/faq=2Erst
>index 7a1614028=2E=2Eb79ba0306 100644
>--- a/documentation/ref-manual/faq=2Erst
>+++ b/documentation/ref-manual/faq=2Erst
>@@ -451,3 +451,14 @@ variant=2E For another example, permissions errors
>might be caused by a
> Makefile that ignores ``DESTDIR`` or uses a different name for that
> environment variable=2E Check the the build system to see if these kinds
> of issues exist=2E
>+
>+**Q:** I'm adding a binary in a recipe but its different in the image,
>what is

s/its/it's/

>+changing it?
>+
>+**A:** The first most obvious change is the system stripping debug
>symbols from
>+it=2E Setting ``INHIBIT_PACKAGE_STRIP`` to stop debug symbols being
>stripped and/or
>+``INHIBIT_PACKAGE_DEBUG_SPLIT`` to stop debug symbols being split into
>a separate
>+file will ensure the binary is unchanged=2E The other less obvious thing
>that can
>+happen is prelinking of the image=2E This is set by default in
>local=2Econf via
>+``USER_CLASSES`` which can contain 'image-prelink'=2E If you remove
>that, the
>+image will not be prelinked meaning the binaries would be unchanged=2E
>--=20
>2=2E25=2E1

I'd use refs to the listed variables to make it easier for people to find =
exactly what to do with them, e=2Eg=2E :term:`INHIBIT_PACKAGE_STRIP`=2E

Quentin
