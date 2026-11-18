Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.545.1795019098912684099
 for <docs@lists.yoctoproject.org>;
 Wed, 18 Nov 2026 08:24:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=POZZ49DK;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 86BFE4E41627
	for <docs@lists.yoctoproject.org>; Wed, 18 Nov 2026 16:24:56 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 4DC3A5FE9B;
	Wed, 18 Nov 2026 16:24:56 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id B8E7011BC276E;
	Wed, 18 Nov 2026 17:24:50 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795019091; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=enVSJL5jvG517eKTnM6AE1tXvfFvmzNUgNro49ALipg=;
	b=POZZ49DKF93h6zaqwwl/7+pR+ULrEj8Uu0zEg0AXeyw4rXXQe0VY2wuatXN2wb0qBQQzXg
	UABF5Ri8uudNQ9C38QcB9SSWFyb9ZiprheAf347BziD6IEdNOk+xvSedvvbo9tQDDhVs/1
	ixccHZzjUFRHiYxAOiqf0P7xyVEooaUJgDKgI4AdveRXX70959LzfJVU6ixehK3vLTfo/d
	72KwCmqz3a1vy8BML8koipBBXgUj5Ve4dpbaoGorfCJQxjXHINoW0xytmR+LoJhHMFBmo2
	UZwFOSsxIYAzXbjBTSvyc3hfrfLwDpMrdF+TEc45Fl8YMqUCjGxEVyXSIsQ7Qw==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 18 Nov 2026 17:24:49 +0100
Message-Id: <DMYH5TW61WRN.200Z8HFGKA2IL@bootlin.com>
Cc: "Thomas Petazzoni" <thomas.petazzoni@bootlin.com>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: "Quentin Schulz" <quentin.schulz@cherry.de>,
 <docs@lists.yoctoproject.org>
Subject: Re: [docs] [PATCH 1/3] tools/gen-releases-svg: add script
References: <20261022-mermaid-release-diagram-v1-0-3351b5799dd9@bootlin.com>
 <20261022-mermaid-release-diagram-v1-1-3351b5799dd9@bootlin.com>
 <bef9eadf-6fa6-4ddf-8fac-508e6593e80d@cherry.de>
In-Reply-To: <bef9eadf-6fa6-4ddf-8fac-508e6593e80d@cherry.de>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <docs@lists.yoctoproject.org>; Wed, 18 Nov 2026 16:25:06 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10791

Hi,

On Mon Nov 9, 2026 at 2:20 PM CET, Quentin Schulz wrote:
> Hi Antonin,
>
> On 10/22/26 3:37 PM, Antonin Godard via lists.yoctoproject.org wrote:
>> Add a script that can be used to generate the releases.svg diagram by
>> parsing the releases.json file available at
>> https://dashboard.yoctoproject.org/releases.json.
>>=20
>> This should be done periodically when new releases come out.
>>=20
>> Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
>> ---
>>   documentation/tools/gen-releases-svg | 95 ++++++++++++++++++++++++++++=
++++++++
>>   1 file changed, 95 insertions(+)
>>=20
>> diff --git a/documentation/tools/gen-releases-svg b/documentation/tools/=
gen-releases-svg
>> new file mode 100755
>> index 000000000..e091c02de
>> --- /dev/null
>> +++ b/documentation/tools/gen-releases-svg
>> @@ -0,0 +1,95 @@
>> +#!/usr/bin/env python3
>> +#
>> +# Parse releases.json (from https://dashboard.yoctoproject.org/releases=
.json)
>> +# and output a Gantt diagram that shows the state of releases.
>> +#
>> +# Copyright (c) Antonin Godard
>> +#
>> +# SPDX-License-Identifier: MIT
>> +#
>> +
>> +import argparse
>> +import datetime
>> +import json
>> +import shutil
>> +import subprocess
>> +import sys
>> +import tempfile
>> +
>> +from pathlib import Path
>> +
>> +parser =3D argparse.ArgumentParser(
>> +    description=3D"Parse releases.json and output a releases.svg file"
>> +)
>> +parser.add_argument("-i", help=3D"Path to the releases.json file", dest=
=3D"releases_json_path",
>> +                    default=3DPath(__file__).resolve().parent.parent / =
"releases.json")
>> +parser.add_argument("-o", help=3D"Path to the output SVG", dest=3D"outp=
ut",
>> +                    default=3DPath(__file__).resolve().parent.parent / =
"ref-manual/svg/releases.svg")
>
> issue: missing required=3DTrue

Both options have a default value, the script can be called without passing
those, so I don't think we need 'required' here?

> Your script will happily be called without arguments and will fail later=
=20
> on, c.f. https://docs.python.org/3/library/argparse.html#required. I=20
> recommend to either replace -i/-o with RELEASES_JSON/OUTPUT to highlight=
=20
> they aren't optional options, or add required=3DTrue to highlight the=20
> flags aren't optional.
>
>> +args =3D parser.parse_args()
>> +
>> +if not shutil.which("mmdc"):
>> +    sys.exit("mermaid-cli is required for this script to run")
>> +
>> +MMD_HEADER =3D """---
>> +config:
>> +  fontFamily: '"Nimbus Sans", Helvetica, Arial, sans-serif'
>> +  gantt:
>> +    leftPadding: 5
>> +    useWidth: 1600
>> +    useMaxWidth: false
>> +  themeVariables:
>> +      activeTaskBkgColor: '#edf5f9'
>> +      activeTaskBorderColor: '#00557d'
>> +      sectionBkgColor: '#eff6f9'
>> +      sectionBkgColor2: '#eff6f9'
>> +---
>> +%% Generated with documentation/tools/gen-releases-mmd
>> +gantt
>> +    dateFormat YYYY-MM-DD
>> +    axisFormat %b %Y
>> +    tickInterval 6month
>> +    todayMarker off
>> +"""
>> +
>> +with open(args.releases_json_path, "r") as f:
>> +    releases_from_json =3D json.load(f)
>> +
>> +with tempfile.TemporaryDirectory() as tmpdir:
>> +    mmdpath =3D Path(tmpdir) / "diagram.mmd"
>> +    with open(mmdpath, "w", encoding=3D"utf-8") as mmd:
>
> suggestion: replace the above three line with tempfile.NamedTemporaryFile=
?
>
> I don't think we care about the filename of file passed to mmdc? c.f.=20
> https://docs.python.org/3/library/tempfile.html#tempfile.NamedTemporaryFi=
le

The thing is we need to have this file flushed/closed before we passed its =
path
to mmdc, which is why I think using a temp directory here makes sense

>> +        mmd.write(MMD_HEADER)
>> +
>> +        first_active_rel_found =3D False
>> +        for release in releases_from_json:
>> +            codename =3D release["release_codename"]
>> +            series_version =3D release["series_version"]
>> +            if release["status"] =3D=3D "Active Development":
>> +                mmd.write(f"    {codename} {series_version} :done, afte=
r current_rel, 6M\n")
>> +                continue
>> +            if not release["original_release_date"]:
>> +                continue
>> +            original_release_date =3D datetime.datetime.strptime(releas=
e["original_release_date"], "%Y-%m-%dT%H:%M:%S%z")
>> +            if original_release_date < datetime.datetime(2022, 4, 1, tz=
info=3Ddatetime.timezone.utc):
>
> You don't explain why this date specifically. Looking at the diagram=20
> currently on=20
> https://docs.yoctoproject.org/ref-manual/release-process.html#long-term-s=
upport-releases=20
> we have everything since kirkstone, do we want to keep all the older and=
=20
> unmaintained releases forever in this graph or should we only keep the=20
> oldest currently supported release and everything in between until=20
> today? i.e. Scarthgap, Styhead, etc..., til Garburn?

I used this date to mimic the previous diagram which started from Kirkstone=
. But
it's true it might makes more sense to start from the oldest supported rele=
ase,
hence Scarthgap as of writing.

> I also see in the graph Garburn in grey. I think it would make sense to=
=20
> have either a different color for the current WIP branch or actively=20
> mark it as in development.

I was limited to done/active as statuses with the Gantt mermaid diagram. Th=
is
is why I detailed the color meanings in the sentence above the diagram. Not=
 sure
we can do much about it, not sure we should spend too much time on this det=
ail
either though

>> +                continue
>> +            original_release_date =3D original_release_date.date().isof=
ormat()
>> +            end_date =3D datetime.datetime.strptime(release["latest_rel=
ease_date"], "%Y-%m-%dT%H:%M:%S%z")
>> +            end_date =3D end_date.date().isoformat()
>> +            lts =3D False
>> +            if "LTS until" in release["status"]:
>> +                lts =3D True
>
> nitpick: can be simplified
>
> lts =3D "LTS until" in release["status"]
>
>> +            status =3D "done"
>> +            if release["series"] =3D=3D "current":
>> +                status =3D "active"
>> +                if not first_active_rel_found:
>> +                    status +=3D ", current_rel"
>> +                    first_active_rel_found =3D True
>> +                end_date =3D "6M"
>> +                if lts:
>> +                    end_date =3D "4y"
>> +            mmd.write(f"    {codename} {series_version}{" (LTS)" if lts=
 else ""}"
>> +                      f" :{status}, {original_release_date}, {end_date}=
\n")
>> +
>> +    result =3D subprocess.run(
>> +        ["mmdc", "--input", mmdpath, "--output", args.output],
>> +        check=3DTrue,
>> +    )
>
> You do nothing with result.
>
> suggestion: could be replaced by subprocess.check_call(["mmdc",=20
> "--input", mmdpath, "--output", args.output]).

Indeed!

Will send follow-up patches, thanks

Antonin
