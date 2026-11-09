Received: from OSPPR02CU001.outbound.protection.outlook.com (OSPPR02CU001.outbound.protection.outlook.com [40.107.159.2])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5777.1794230426432066462
 for <docs@lists.yoctoproject.org>;
 Mon, 09 Nov 2026 05:20:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=Hr8ZgUWd;
 spf=pass (domain: cherry.de, ip: 40.107.159.2, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ci11c8lkDlQ04gBQmE+ePnW7cDvfce70LYc7pAHn6P2XeoiSdYsWmuLFcrh3bh2n5Hycl+OqIXXZzoem88UVgKIJ4n8RQTZO/5tx9xZUjEE1o5fyPyycekz7ylXRUNEbprDHCaT5fo9jG3HMQSCPnf8R408K0OmJ2i7D4VHtrSakzlR/+3tTV+8QGbEuDMcJFNjjdfrA9ztuCVwdb/GKKA8PZB/YXEo0d8s8jYmOym1qCpHJFz7XYYxSUlqjJ51APQU3nHe+URrNvqZaq9rHOhddqF8un1fk4lK5M3PpqmtuDSZwdUovqyT+Ka+/Qi9xvuCDBsuaaZ2REUF24sxR7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=C8qhrsWjPAvUgLcBvmLh7GMGm/Yx3p0PzmW9oFMjCu4=;
 b=uHPwCyGM0t0eT1bzjyeJd4FBmGjzLuuD8oeqAD2sv4Lh7YnJw4EwR3fL8zcC2rJspLBN/s6qVT/ZUhEqdck3yNXg2ML6LSRobg0N2SEAmFSnF0zRQncWTnxh7PuyN5Cl63jSAXDGoVogColLOML/QzvozWYryV6GgJV3MSS8pqjJi7HUdRddHiA3lS6vPbGp/RcaSzjATsg/M43nYAFYb0ZctEQ/ONafvujKRKbpLEcROdsVo7n68gcn7eRtrbY/HS8untSlWcw8hXCY1upWfkFeMHIxy4tXAARsP4dB4R+lRa1f24CSHkvY0aYPZKfet78EklQHqONISRI1rgYkRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C8qhrsWjPAvUgLcBvmLh7GMGm/Yx3p0PzmW9oFMjCu4=;
 b=Hr8ZgUWdcgO2y/NYlo6E5R033Fwv5TF+thgCesJqhy635TVw/zoK6ROQoqqM+uo+WJnpmszCmt/fR1JJw9/IzDrkTI+VTRASdHj1lQADOiRdFthWpdJF6OQKYeRvDzz9KWVnpsRZDbz0hkMRAlod2y2+bQUQrFtHb3ax55EgbTA=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from PA3PR04MB11153.eurprd04.prod.outlook.com (2603:10a6:102:4ab::7)
 by PAXPR04MB9219.eurprd04.prod.outlook.com (2603:10a6:102:222::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.13; Mon, 9 Nov
 2026 13:20:18 +0000
Received: from PA3PR04MB11153.eurprd04.prod.outlook.com
 ([fe80::6b02:c0eb:95a4:3c3d]) by PA3PR04MB11153.eurprd04.prod.outlook.com
 ([fe80::6b02:c0eb:95a4:3c3d%5]) with mapi id 15.21.0592.010; Mon, 9 Nov 2026
 13:20:18 +0000
Message-ID: <bef9eadf-6fa6-4ddf-8fac-508e6593e80d@cherry.de>
Date: Mon, 9 Nov 2026 14:20:17 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH 1/3] tools/gen-releases-svg: add script
To: antonin.godard@bootlin.com, docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20261022-mermaid-release-diagram-v1-0-3351b5799dd9@bootlin.com>
 <20261022-mermaid-release-diagram-v1-1-3351b5799dd9@bootlin.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20261022-mermaid-release-diagram-v1-1-3351b5799dd9@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: VI5PEPF0000092F.AUTP296.PROD.OUTLOOK.COM
 (2603:10a6:808:1::835) To PA3PR04MB11153.eurprd04.prod.outlook.com
 (2603:10a6:102:4ab::7)
Return-Path: quentin.schulz@cherry.de
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA3PR04MB11153:EE_|PAXPR04MB9219:EE_
X-MS-Office365-Filtering-Correlation-Id: 21007df4-1aeb-488f-78ff-08df3e6432bc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|23010399003|10067099003|5023799004|11063799006|4143699003|56012099006|261021123027099003|261021133027099003|261021135927099003|261021130227099003|261021121427099003|261022115727099003|261022075727099003|261022105027099003|261022113327099003|261026130827099003|261009223027099003|261026135527099003|261026140227099003|261028144727099003|261026121527099003|261102123227099003|22082099003|18002099003|6133799003|13003099007|4133799003|3023799007;
X-Microsoft-Antispam-Message-Info: zoY8E4yq2SX8Qwaepka9NH3tYFZwYThomaPuvgku7VBcLj4U+cyd+EhUYwZHvuFrWMEGYx0okKbtYktVDzzXWnFDsr89hddiw8ZrioZMwYKAcuGT3qx88cPGb8H6LymgbRUHuvjccTAkgvpIxpDJaJp8u6Z2agkWAhxeTP1/Nj7IJen54uniy9OnsoazKjDcPkk0Ieap9RAU8Da9yJ/ct37H8j5xJgn1NwPAPN+3vUeZLxsGOrmU3D/rkg2RbndjO1TDIBOjGKGqK1Ms4cxfzWbbtHUzjfIScfGQU0gPcDQ5NfPWOaIW9v9F3rkLX49yeEveyqPyH9sRtM1/s1pYXZELKJWVjHowwaxZx9aBmFzZ+TiERT0K7AV38z92ODoz7lVtO5yXBBujr8vCE5KWxMH+SIg14fotAN6tOHC73wld+Ck5wvVfegbG3SBM0IeGzjTGsygNB0jWkixdiGxpRRrHKW56K8yFFmCx7ymjgVCHRYwg7VQ/246DhUDs3Ev2IoQXKwx9Zvb1nm6i/qNRciL6hx4IN59bA0zQBZthjg7xh25DM7H+5BwLXvsZ62qBrLNHEBgwj4vg6sL0td6G0WzLkD98yCgfcAdkQK322raHv3n28YJNypc/GkvyTQ76
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA3PR04MB11153.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(23010399003)(10067099003)(5023799004)(11063799006)(4143699003)(56012099006)(261021123027099003)(261021133027099003)(261021135927099003)(261021130227099003)(261021121427099003)(261022115727099003)(261022075727099003)(261022105027099003)(261022113327099003)(261026130827099003)(261009223027099003)(261026135527099003)(261026140227099003)(261028144727099003)(261026121527099003)(261102123227099003)(22082099003)(18002099003)(6133799003)(13003099007)(4133799003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Qm80ZmdCUWFCK0gwS2s0dXA0Nkl3ZXF3K3ZnMnQ2M1lWTWdUQUIzeXFvYjFF?=
 =?utf-8?B?a21SMHZNTGVwd3ZSQktyNHozWFVYNEV6amcrdmZINWpLNTVqS1dGY0kxQjd1?=
 =?utf-8?B?MHFqeDlGUDNNZHlQZCtGR1BVUnJteHZPaG03TXZscnVkRFpGM2p6Nk44MTJy?=
 =?utf-8?B?NXdZcVFsZG1mNmpleFNTOWl3VFNMOGFuRXh4dVZaNDViZ3gyVTVldTJNelNU?=
 =?utf-8?B?eTRyL3U3MTVOU3J1Ly9USUt0eStLSE5nQkhocTVMcXd4N0pzZkd6SVBnNUdD?=
 =?utf-8?B?eVJXUlkzVTFlK0NTSnRSMUZ0MWlnbUFCUlBXdWN4bUNxWWtQUkhZYVp6SkJz?=
 =?utf-8?B?L3g3WkNSenZvczluK1JzOUZ1di9mL1NKNk8wc2ZIWGE0M2JBVUc3aGZpTnNX?=
 =?utf-8?B?QWFnTVorTkZ3WmdkQXFaNEFqalVZSkFpZmd5N2ZoNFNGYVRGdHIvREtaeThV?=
 =?utf-8?B?OC9BcVQ0QUxMNVZ1a2QxWjVDUk95azRiY1RHbVVaTG1PS0dDa0JpTHZKNktX?=
 =?utf-8?B?YmJhU1U5U2RGeTdEdXFUanhQengzR0xESHhJcjgwTnRZMllHUkUvRDgvbE4w?=
 =?utf-8?B?KzZGbHg2MkwvelV0RTFqdjV5akpzSVdEOTBXYmp6VWdGVkZRNDVFWTdaNVBa?=
 =?utf-8?B?L2xFOHBqVFBqVFRwbnVkRHJzbE9kNVJLVnhabmFoOVRMOWNzN2dEUytHVGlr?=
 =?utf-8?B?V2E5aEVSR09paVZUNWJKVnRPaUtTUXprS2RZWnllbTRpcmhiZ0xLOHM0S3po?=
 =?utf-8?B?N0ljNG1yOWJvczl3SitxbXpnV1FJNTNidDZKVExLMnlKeGJidjExTnRGOHU0?=
 =?utf-8?B?OTNucDdLcnJjMDltemlWd2JLN0laalhmaWI2SHBIMzRUbW1hTnAzRkwrQ05Z?=
 =?utf-8?B?RXhYTFJKS0YzRUJ5dVZHQ1hqWUtZZHBvazZpOHRPUytEVmVxNUVkNG9LVW9E?=
 =?utf-8?B?NUlwU3ptZUJOb01hUFlOS1pHMjlDYXpZQ3IxRTRiRFlCbVlEVUVQTCs4S3dL?=
 =?utf-8?B?M2UrNkJPRUozOW40R0dPWEFJVG83ZzR4OFNMdmNBemxTdGlzTitUbzd1VnZO?=
 =?utf-8?B?TkR6d1RCQ1p5aVpBQ0ZOZTJxck5CNCtNYThxMy9oVm1Hd04vL0pQVzlmSHcy?=
 =?utf-8?B?alRvR3o2N0JQS0tKQ0k3Tk5nU004WjFXdVRudWN3OEcxUlV1bTduelFqWldG?=
 =?utf-8?B?RWN0Ui9YTEFFdm9kUkZiYmZpSUZrNTVnVHlyRnJiR2EvQWE0K25oTTJ0ZVlX?=
 =?utf-8?B?dnFmSHI3R3JDU3JyZkxSL1kxQndGLzRIMktrNEZ4QzhUUSs2VVRxYmVxaENi?=
 =?utf-8?B?TW0xNnhhTmxqcnBISDFYVERQeXFMNXltbXhHdG1QWXBxbHZaYTdZbkN5U3Vy?=
 =?utf-8?B?emdLM3dTVVgySFFnOUdXbkxXSERnVzh5aUc3Z3o5Y0N1M2ZrSzhBdjVpL1JO?=
 =?utf-8?B?TkI4anJySzg3THhFQitkdE1ic3JZOWhEQWJOZ25rVXo3WSsySVA3d0ViaDZL?=
 =?utf-8?B?ZGlUN01IYm1jTG0zL2RTdlNONi9ocmtLdGMwOCt1bFJ0SEpSbHl4Q3J1STRL?=
 =?utf-8?B?aE85K25VbTdlU3dUZW5jUm1XUVUwSVpWQmVtSGpMUzR2RDBPeStNWWZRdFJa?=
 =?utf-8?B?TXFqb1F1dzdwenlsakRtbmxjbkRNbHJabmRKWU9iY3NQOHR3S21qMC94Yis4?=
 =?utf-8?B?UEZBeVNOWVpiMGUvT3pMTjNQWVc2bW1sdXVpVEkybzJGMDk2LzJBNjZzbmRU?=
 =?utf-8?B?STUwRE9NelJoYXRsMVRuZ3ZtNE5kMmtrS1RGc211Z1NyVlZWNVg0MU56eko3?=
 =?utf-8?B?Y3Ezbk1pS1hocXRsamVUZWUwWXpJTkp6UHg5WDBNL2JrUzh2SmlIOWZkOEdI?=
 =?utf-8?B?WXhudnJLVWoydWlZeUprR0hCUU4xZXJqNUNyQlN3M2JEbEFzYWg1RTYwVDBZ?=
 =?utf-8?B?UWNWMEhoU2RJeERyRWl3dG1JWFg1SUNucWZuSmZNZ0wya3RzQjMxeDRaeTd0?=
 =?utf-8?B?dFpndTVBWGtDaFB3R2xwV1pGWEF3WXA0dDUwUnhQeEloZlRTK3VjMnVlM0pr?=
 =?utf-8?B?T3dBYVZYaVMzUHc2WW9XSk4wM2lZYVV5SUx6cDNqUkhaZkE2NURxRzh1RFBU?=
 =?utf-8?B?Q3pyK3kwUS82M0dtT2tsWXZUdnVOYVQ2NlE5NFNrMG02QU9BS3k3bHgyN1Vi?=
 =?utf-8?B?YUY1MUhnckNyWEJycXBKY1AwYXlhZThTdUlUMzJ4eVg2VjJEQ1g4NGpud2Js?=
 =?utf-8?B?SXBSU25WSHF1V0RlRE9CRFd2VXlaTXhnS2tQSi9qU1Z5eTMyR1lrY3ZyRVZi?=
 =?utf-8?B?M3FvWkpxSVUxQ3BhSjA0RVRnNmJBWEFScENjaktaK0pEaGtpQ0lkdz09?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 21007df4-1aeb-488f-78ff-08df3e6432bc
X-MS-Exchange-CrossTenant-AuthSource: PA3PR04MB11153.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Nov 2026 13:20:17.9988
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BHQFAjDc3sGtP2sK27dK9OytXWw9ll2yc7pEq5twr+4OkRFNhT3QiOdJvuz1hKKwm5uO3inQtF4SB0b8dcnrbrkVfKIhqn9szwPcbC9mLK0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9219
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <docs@lists.yoctoproject.org>; Mon, 09 Nov 2026 13:20:28 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10783

Hi Antonin,

On 10/22/26 3:37 PM, Antonin Godard via lists.yoctoproject.org wrote:
> Add a script that can be used to generate the releases.svg diagram by
> parsing the releases.json file available at
> https://dashboard.yoctoproject.org/releases.json.
> 
> This should be done periodically when new releases come out.
> 
> Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
> ---
>   documentation/tools/gen-releases-svg | 95 ++++++++++++++++++++++++++++++++++++
>   1 file changed, 95 insertions(+)
> 
> diff --git a/documentation/tools/gen-releases-svg b/documentation/tools/gen-releases-svg
> new file mode 100755
> index 000000000..e091c02de
> --- /dev/null
> +++ b/documentation/tools/gen-releases-svg
> @@ -0,0 +1,95 @@
> +#!/usr/bin/env python3
> +#
> +# Parse releases.json (from https://dashboard.yoctoproject.org/releases.json)
> +# and output a Gantt diagram that shows the state of releases.
> +#
> +# Copyright (c) Antonin Godard
> +#
> +# SPDX-License-Identifier: MIT
> +#
> +
> +import argparse
> +import datetime
> +import json
> +import shutil
> +import subprocess
> +import sys
> +import tempfile
> +
> +from pathlib import Path
> +
> +parser = argparse.ArgumentParser(
> +    description="Parse releases.json and output a releases.svg file"
> +)
> +parser.add_argument("-i", help="Path to the releases.json file", dest="releases_json_path",
> +                    default=Path(__file__).resolve().parent.parent / "releases.json")
> +parser.add_argument("-o", help="Path to the output SVG", dest="output",
> +                    default=Path(__file__).resolve().parent.parent / "ref-manual/svg/releases.svg")

issue: missing required=True

Your script will happily be called without arguments and will fail later 
on, c.f. https://docs.python.org/3/library/argparse.html#required. I 
recommend to either replace -i/-o with RELEASES_JSON/OUTPUT to highlight 
they aren't optional options, or add required=True to highlight the 
flags aren't optional.

> +args = parser.parse_args()
> +
> +if not shutil.which("mmdc"):
> +    sys.exit("mermaid-cli is required for this script to run")
> +
> +MMD_HEADER = """---
> +config:
> +  fontFamily: '"Nimbus Sans", Helvetica, Arial, sans-serif'
> +  gantt:
> +    leftPadding: 5
> +    useWidth: 1600
> +    useMaxWidth: false
> +  themeVariables:
> +      activeTaskBkgColor: '#edf5f9'
> +      activeTaskBorderColor: '#00557d'
> +      sectionBkgColor: '#eff6f9'
> +      sectionBkgColor2: '#eff6f9'
> +---
> +%% Generated with documentation/tools/gen-releases-mmd
> +gantt
> +    dateFormat YYYY-MM-DD
> +    axisFormat %b %Y
> +    tickInterval 6month
> +    todayMarker off
> +"""
> +
> +with open(args.releases_json_path, "r") as f:
> +    releases_from_json = json.load(f)
> +
> +with tempfile.TemporaryDirectory() as tmpdir:
> +    mmdpath = Path(tmpdir) / "diagram.mmd"
> +    with open(mmdpath, "w", encoding="utf-8") as mmd:

suggestion: replace the above three line with tempfile.NamedTemporaryFile?

I don't think we care about the filename of file passed to mmdc? c.f. 
https://docs.python.org/3/library/tempfile.html#tempfile.NamedTemporaryFile

> +        mmd.write(MMD_HEADER)
> +
> +        first_active_rel_found = False
> +        for release in releases_from_json:
> +            codename = release["release_codename"]
> +            series_version = release["series_version"]
> +            if release["status"] == "Active Development":
> +                mmd.write(f"    {codename} {series_version} :done, after current_rel, 6M\n")
> +                continue
> +            if not release["original_release_date"]:
> +                continue
> +            original_release_date = datetime.datetime.strptime(release["original_release_date"], "%Y-%m-%dT%H:%M:%S%z")
> +            if original_release_date < datetime.datetime(2022, 4, 1, tzinfo=datetime.timezone.utc):

You don't explain why this date specifically. Looking at the diagram 
currently on 
https://docs.yoctoproject.org/ref-manual/release-process.html#long-term-support-releases 
we have everything since kirkstone, do we want to keep all the older and 
unmaintained releases forever in this graph or should we only keep the 
oldest currently supported release and everything in between until 
today? i.e. Scarthgap, Styhead, etc..., til Garburn?

I also see in the graph Garburn in grey. I think it would make sense to 
have either a different color for the current WIP branch or actively 
mark it as in development.

> +                continue
> +            original_release_date = original_release_date.date().isoformat()
> +            end_date = datetime.datetime.strptime(release["latest_release_date"], "%Y-%m-%dT%H:%M:%S%z")
> +            end_date = end_date.date().isoformat()
> +            lts = False
> +            if "LTS until" in release["status"]:
> +                lts = True

nitpick: can be simplified

lts = "LTS until" in release["status"]

> +            status = "done"
> +            if release["series"] == "current":
> +                status = "active"
> +                if not first_active_rel_found:
> +                    status += ", current_rel"
> +                    first_active_rel_found = True
> +                end_date = "6M"
> +                if lts:
> +                    end_date = "4y"
> +            mmd.write(f"    {codename} {series_version}{" (LTS)" if lts else ""}"
> +                      f" :{status}, {original_release_date}, {end_date}\n")
> +
> +    result = subprocess.run(
> +        ["mmdc", "--input", mmdpath, "--output", args.output],
> +        check=True,
> +    )

You do nothing with result.

suggestion: could be replaced by subprocess.check_call(["mmdc", 
"--input", mmdpath, "--output", args.output]).

Cheers,
Quentin
