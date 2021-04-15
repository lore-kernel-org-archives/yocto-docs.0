Received: from bsmtp3.bon.at (bsmtp3.bon.at [213.33.87.17])
 by mx.groups.io with SMTP id smtpd.web11.61.1618505618332366607
 for <docs@lists.yoctoproject.org>;
 Thu, 15 Apr 2021 09:53:39 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: streamunlimited.com, ip: 213.33.87.17, mailfrom: quentin.schulz@streamunlimited.com)
Received: from qschulz (vpn.streamunlimited.com [91.114.0.140])
	by bsmtp3.bon.at (Postfix) with ESMTPSA id 4FLllz6rNYz5tlD;
	Thu, 15 Apr 2021 18:53:35 +0200 (CEST)
Date: Thu, 15 Apr 2021 18:53:34 +0200
From: "Quentin Schulz" <quentin.schulz@streamunlimited.com>
To: Michael Opdenacker <michael.opdenacker@bootlin.com>
Cc: docs@lists.yoctoproject.org
Subject: Re: [docs] [PATCH] manuals: simplify colon usage
Message-ID: <20210415165334.dg4et6isnz56xzy6@qschulz>
References: <167613DD803B4636.18329@lists.yoctoproject.org>
 <c0301119-4642-4f26-ce90-71679c433a40@bootlin.com>
MIME-Version: 1.0
In-Reply-To: <c0301119-4642-4f26-ce90-71679c433a40@bootlin.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Michael,

On Thu, Apr 15, 2021 at 06:14:33PM +0200, Michael Opdenacker wrote:
>=20
> On 4/15/21 6:09 PM, Michael Opdenacker wrote:
> > - This replaces instances of ": ::" by "::", which
> >   generates identical HTML output
>=20
> I'll propose the same changes to the Bitbake manual :)
>=20

Great first patch... but still a few occurences are left :)

It'd be awesome if you could follow up with another patch fixing
`:<newline>::`, see:

=E2=9E=9C  documentation git:(master) =E2=9C=97 ag -Rc ":\n\s*::"
overview-manual/development-environment.rst:2
dev-manual/start.rst:10
dev-manual/qemu.rst:8
dev-manual/common-tasks.rst:340
0001-docs-fix-missing-and-surrounding-references-from-pok.patch:10
sdk-manual/appendix-customizing.rst:9
overview-manual/concepts.rst:17
sdk-manual/using.rst:2
sdk-manual/extensible.rst:27
sdk-manual/working-projects.rst:20
ref-manual/variables.rst:283
ref-manual/migration-2.1.rst:3
ref-manual/terms.rst:1
ref-manual/migration-1.3.rst:1
ref-manual/structure.rst:6
ref-manual/images.rst:1
ref-manual/migration-2.0.rst:3
ref-manual/migration-2.2.rst:4
ref-manual/migration-3.1.rst:1
ref-manual/features.rst:1
ref-manual/migration-2.5.rst:2
ref-manual/migration-1.7.rst:2
ref-manual/kickstart.rst:2
ref-manual/faq.rst:4
ref-manual/migration-2.3.rst:5
ref-manual/tasks.rst:16
ref-manual/migration-1.4.rst:2
ref-manual/migration-1.6.rst:2
ref-manual/devtool-reference.rst:17
ref-manual/system-requirements.rst:23
ref-manual/migration-2.6.rst:5
ref-manual/classes.rst:29
ref-manual/qa-checks.rst:3
kernel-dev/maint-appx.rst:5
kernel-dev/concepts-appx.rst:2
kernel-dev/advanced.rst:29
kernel-dev/faq.rst:2
kernel-dev/common.rst:75
sdk-manual/appendix-obtain.rst:10

You probably want to use `ag -Rc ":\s*::"` after this patch has been
applied to find all weird corner cases (like, a line ending with `: `.

Also, I think it is time to start a CONTRIBUTING file or whatever the
appropriate name for a file about guidelines would be.

At least, it would help us the day to remember the "rules" once we have
the time to create a linter :)

But not needed for this patch to be merged obviously.

Cheers,
Quentin
--=20
StreamUnlimited Engineering GmbH
High Tech Campus Vienna, Gutheil-Schoder-Gasse 10, 1100 Vienna, Austria
Fax: +43 1 667 20 02 4401
quentin.schulz@streamunlimited.com, www.streamunlimited.com
