Received: from relay12.mail.gandi.net (relay12.mail.gandi.net [217.70.178.232])
 by mx.groups.io with SMTP id smtpd.web10.8261.1603889010358031788
 for <docs@lists.yoctoproject.org>;
 Wed, 28 Oct 2020 05:43:30 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: 0leil.net, ip: 217.70.178.232, mailfrom: foss@0leil.net)
Received: from [192.168.13.190] (80-110-109-234.cgn.dynamic.surfer.at [80.110.109.234])
	(Authenticated sender: foss@0leil.net)
	by relay12.mail.gandi.net (Postfix) with ESMTPSA id 32F2A200006;
	Wed, 28 Oct 2020 12:43:27 +0000 (UTC)
Date: Wed, 28 Oct 2020 13:43:22 +0100
In-Reply-To: <b440e47d516b12f5aeac01b9f184f16eb0cc056f.1603839557.git.paul.eggleton@linux.microsoft.com>
References: <cover.1603839557.git.paul.eggleton@linux.microsoft.com> <b440e47d516b12f5aeac01b9f184f16eb0cc056f.1603839557.git.paul.eggleton@linux.microsoft.com>
MIME-Version: 1.0
Subject: Re: [docs] [PATCH 1/7] ref-manual: add reference anchors for each QA check
To: docs@lists.yoctoproject.org,Paul Eggleton <paul.eggleton@linux.microsoft.com>
From: "Quentin Schulz" <foss@0leil.net>
Message-ID: <2DB7C943-5B90-42ED-8774-22AA03FDAC0C@0leil.net>
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi Paul,

Nice addition :)

On October 28, 2020 2:18:29 AM GMT+01:00, Paul Eggleton <paul=2Eeggleton@l=
inux=2Emicrosoft=2Ecom> wrote:
>From: Paul Eggleton <paul=2Eeggleton@microsoft=2Ecom>
>
>Make it possible to link to the explanation for a particular QA check=2E
>
>Signed-off-by: Paul Eggleton <paul=2Eeggleton@microsoft=2Ecom>
>---
>documentation/ref-manual/ref-qa-checks=2Erst | 36
>++++++++++++++++++++++++++++++
> 1 file changed, 36 insertions(+)
>
>diff --git a/documentation/ref-manual/ref-qa-checks=2Erst
>b/documentation/ref-manual/ref-qa-checks=2Erst
>index 5b9f92d=2E=2E228b4fd 100644
>--- a/documentation/ref-manual/ref-qa-checks=2Erst
>+++ b/documentation/ref-manual/ref-qa-checks=2Erst
>@@ -43,6 +43,8 @@ error form along with an explanation=2E
> Errors and Warnings
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>=20
>+=2E=2E _qa-check-libexec:

If I'm not mistaken, we have ref-classes-<class> and ref-tasks-<task> alre=
ady=2E So for consistency, I'd name them ref-qa-checks-<qa-check>=2E

Nothing else to nitpick on=2E

Quentin
