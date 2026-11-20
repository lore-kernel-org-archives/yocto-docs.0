Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1984.1795162371887305794
 for <docs@lists.yoctoproject.org>;
 Fri, 20 Nov 2026 00:12:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=roYEaohx;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id A1CDF1A173D
	for <docs@lists.yoctoproject.org>; Fri, 20 Nov 2026 08:12:49 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 6F0BB6017D;
	Fri, 20 Nov 2026 08:12:49 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id E5B2411BC0CF6;
	Fri, 20 Nov 2026 09:12:47 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795162369; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=6cwLoccBAQDbqnRn2pot+PbXH7fKTbYUj8UA1F6ZVFE=;
	b=roYEaohxPzmFjkS0qkX/8gsw6Uf23KBq+qMHYyukjgz3BqgKjNMrRILoGrMShvDBDLzSUF
	8vufDh/UDvSf7671L84hP/k71OVEIZnpNikFVgsJAajh2ICzfImpFduuUZ0yVT3PecPhgt
	O3TT6JYiIuUaY3snBJX3R104keWv7EudmdWCvaWL9KwV6tqTrUzELfLPmnlbSwejjEdjOF
	XAbjC7IMxPBFIWb1r25Dg8bIBVRaG6uWp1ZCeTRGSQM6tBxQUqAO1Ih8djaJEOOX10PNeL
	YoqVymau73pyIv7UJChIJPTpqhA5scWd13qqdy/9i07qDrmHPqElccTUd/9irA==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 20 Nov 2026 09:12:46 +0100
Message-Id: <DMZVY66DTQYK.1QRZXJ9LWNQ49@bootlin.com>
Cc: "Thomas Petazzoni" <thomas.petazzoni@bootlin.com>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: "Quentin Schulz" <quentin.schulz@cherry.de>,
 <docs@lists.yoctoproject.org>
Subject: Re: [PATCH 2/4] tools/gen-releases-svg: start showing releases from
 oldest active one
References: <20261119-gen-releases-svg-fixes-v1-0-b6245fbf8294@bootlin.com>
 <20261119-gen-releases-svg-fixes-v1-2-b6245fbf8294@bootlin.com>
 <f188f220-d21f-4953-b56d-80e56f293e4b@cherry.de>
In-Reply-To: <f188f220-d21f-4953-b56d-80e56f293e4b@cherry.de>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <docs@lists.yoctoproject.org>; Fri, 20 Nov 2026 08:12:56 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10806

On Thu Nov 19, 2026 at 1:48 PM CET, Quentin Schulz wrote:
> Hi Antonin,
>
> On 11/19/26 8:55 AM, Antonin Godard wrote:
[...]
>
> question: ways to get a more meaningful diff?
>
> Phew, that's a mouthful. Do you know if there's any way to maybe not=20
> minify the SVG so the diff is more palatable?

I wish it did, but didn't find an option to do so with Mermaid, even being =
able
to output it with some indentation :/

>> index 6a601b010..77281f37d 100755
>> --- a/documentation/tools/gen-releases-svg
>> +++ b/documentation/tools/gen-releases-svg
>> @@ -54,6 +54,16 @@ gantt
>>   with open(args.releases_json_path, "r") as f:
>>       releases_from_json =3D json.load(f)
>>  =20
>> +# Find the oldest active release release date to make it the start of o=
ur timeline.
>> +active_release_dates =3D []
>> +for release in releases_from_json:
>> +    if release["series"] =3D=3D "previous":
>> +        continue
>> +    if not release["original_release_date"]:
>> +        continue
>> +    active_release_dates.append(datetime.datetime.strptime(release["ori=
ginal_release_date"], "%Y-%m-%dT%H:%M:%S%z"))
>> +oldest_supported_release_date =3D sorted(active_release_dates)[0]
>> +
>
> suggestion: ditch the array
>
> No need for an array, simply keep the oldest date.
>
> oldest_supported_release_date =3D datetime.datetime.now()
> for release in releases_from_json:
>      if release["series"] =3D=3D "previous":
>          continue
>      if not release["original_release_date"]:
>          continue
>      oldest_supported_release_date =3D min(oldest_supported_release_date,=
=20
> datetime.datetime.strptime(release["original_release_date"],=20
> "%Y-%m-%dT%H:%M:%S%z"))

Yup, better thanks!

Antonin
