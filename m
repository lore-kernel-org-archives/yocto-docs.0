Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DFE8FFD7F91
	for <webhook@archiver.kernel.org>; Fri, 27 Feb 2026 10:26:30 +0000 (UTC)
Received: from OSPPR02CU001.outbound.protection.outlook.com (OSPPR02CU001.outbound.protection.outlook.com [40.107.159.19])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.92899.1772187986475374215
 for <docs@lists.yoctoproject.org>;
 Fri, 27 Feb 2026 02:26:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=H0G+GL0Z;
 spf=pass (domain: cherry.de, ip: 40.107.159.19, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UQUf6C4bsBmyNPyLrVm9nqubLAop3tPYJskYnH+LbLgeBojqR8dGj+CHYj/alyeOWCjtpe0jNFUe+zpkO1og+VjKoxTHFuYMAf+zeHsdtLNyp9Ekf/ninzu0qgZt4VcK4OXV+EFUIbj9iPdDYfp+xVakTyXVml3gtRlq9MeQDmFszkpiDMqGfa7HK+XjGF97LYoeDY+JMKjF3dupfMT5iS6675PMUk0trFvUVJsN4fMwktSuNlrbabTUDI6PufmZ9uLMoEKP4bo4rw/RHwSDFdAPpYw24yuVKA4Jqvyus4rbVb0jNDFSeen6oQnW0SUeY5ruUNZoq+EstFMB1GGuvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=roRNmMaoWFVTrhobCSJU3L7wkgZUXjofwHgYJdcI7mE=;
 b=ej3pXsC1rhjLwAsN2jOMa5Kg7xzwTbzPFH3foOBHj/yO2dTYYXpv32eFsz+GZtpUJpXLIqCirgx7X63YFMV6BDzLIxiXq/rcpmJ3wVI6/Z23UIqC4sgDtMTgPP7sYoj4ZPKC0sG17r29KbjSAq3c53gfGSZo0E9S8JO4T1kFwZWhlLqDv4v3O3PLvu5BKrn+6R4OdA5BiB/izNEz6at9Q0ma8cNpsoYJrJn6YO29K+TJ6XSWH4qYWf0bAALoWkUx/aMnNiuAqIm8vkZAudjKBIU4hIapZ57E1p+EBNqswaQ7VdEV6T/wxFE9+Afx+GprOHZcWwCv+hQd/eWqDYij2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=roRNmMaoWFVTrhobCSJU3L7wkgZUXjofwHgYJdcI7mE=;
 b=H0G+GL0ZSKOps3PksmBXsDRzCGE7DDHVycTFrdoy4s+eqk1oELFzDoHUmb3+4YZ0LUE53fsNrZ8TwX19386uMWA7I7itzcINO8V/simsdIs6MJpS7LrS8t1NR+UMQC4D9eD6cfz51/U1ulmxbZugiJzUXEH6lxTzwgestKi47QY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com (2603:10a6:150:2be::5)
 by AS8PR04MB7686.eurprd04.prod.outlook.com (2603:10a6:20b:290::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.13; Fri, 27 Feb
 2026 10:26:20 +0000
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::6c04:8947:f2f0:5e78]) by GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::6c04:8947:f2f0:5e78%5]) with mapi id 15.20.9654.013; Fri, 27 Feb 2026
 10:26:20 +0000
Message-ID: <38678bef-ba8f-4181-85f4-c367c3f6dc29@cherry.de>
Date: Fri, 27 Feb 2026 11:26:16 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH v2 1/3] tools/fetch-releases-json: add to fetch and
 format releases.json
To: antonin.godard@bootlin.com, docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20260226-releases-json-v2-0-6ba4a3b37b24@bootlin.com>
 <20260226-releases-json-v2-1-6ba4a3b37b24@bootlin.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20260226-releases-json-v2-1-6ba4a3b37b24@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: FR5P281CA0016.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:f1::14) To GVXPR04MB12038.eurprd04.prod.outlook.com
 (2603:10a6:150:2be::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR04MB12038:EE_|AS8PR04MB7686:EE_
X-MS-Office365-Filtering-Correlation-Id: 420c3beb-13c7-4f9c-3df6-08de75eaa5c6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|376014|13003099007|7053199007;
X-Microsoft-Antispam-Message-Info: 
	iHbHN3EP2we1FOAh9InP67P/xj616VGfe2Rgs/xAZE3bwnZKxa89lsEBAMu+dWTyXPlI/sbaz45+rXGKXQPO3PqU/5KrWMZGvFBDj5xGXLJBSnqrVALw9dUE5ATIeKyr2DISUUa7iYXKufiktnWLuRM9pDSyEsYVhnpJ17o/16nNo8lzRw4XuIP/p3ujfqipPbMb8V/0rXmFTA0nZq5NjApff+vBC39ry4BPNwWk0IBLi5fW/gEaI9fVammpytRvI3Hyud2C/k3Qsgenyo8i0OupLyFXXYZ9njxnMjLrpbElvSEzrbcVg9p7BT4L7YM29g4u+gb9do4Z4kqsS1u181HjYxcHT8l/VwjKdgt6yJxhbhYeEqOPJHsGfpj5C2wuxc/8vaZuE+Lfti4qGMYLAQ5j1+xrpMf95O9JiAgIrAwcHYw06f/y0Zu+2BaQa0Pcc1+JP+6xWRfrGWLFAvlgRB0/5ZRCZHmLKG6d4Svn2VawJvFiWe7qrWiDFbHVmX2X0PsPbU46VTKLKh/qXAnyvK+J+7Gyo2Qc/wIZm6tM1zrlo1yWVkoaHtzlHfQ/Bz3foq0AZI2AcYStLblVElgcGEB4SUeb3tUHOnOlnJlIIdH7Y9AWtJVWfE/LDUz+LT75PB7F+HXA7VV9Lf9fHYbgdJhC2YGCu4dOPrGD/eSGCvXCNJ9cEsFgZ7cIIatV2j4r
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB12038.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(13003099007)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?Q0xTeFZQTWljQkgvYkRzLzB6UUNXTm1EdTdWYzJQUk5DTTZCK0k0MnVLM1ll?=
 =?utf-8?B?bzRpZ0U5Nmh0N1B1OGkrQkRzNGJadWRvQkhGbHZNQzJFQkp0LzdCV3BMRHBI?=
 =?utf-8?B?a2hWOGk2amo4b3B3SjI2SjBwZUd6UW40emhPaUxyWEVUNWw3L1BzNDVTSUlV?=
 =?utf-8?B?RzZyN3B5ZXBWSkUyUm1hUmdCbG9yL21yN2ZtZHE3RDlWdXpxL2g1UDVFcGx3?=
 =?utf-8?B?MWlaR0k3by9PSXVDUk84MHlsS3JPMVpPQ291L3AydHZaUHMzeUUwTGxSanRn?=
 =?utf-8?B?VGpyRW5KcVpwOHhzVzNlUDkvWlcwZDRFMENHbExTRlZWUVdZWUN5Um15d3N6?=
 =?utf-8?B?VWh4ZTZSLzhJQjhmZEJvWW9TUmUxUWVtWTAxZlVIbGFzaG90N0ZMbDFybTFS?=
 =?utf-8?B?dHM2OGZsQ0o3SWZGNXFxV3RnRnVNWEQ0eVpaSUkvWDMyRUtwVG1NeHdnKzlI?=
 =?utf-8?B?K0FNTlN6K3U0cFBPQytQYlcwSnpFRVA2cFR6QjlxV0pMYnI3UjZpWFkxZGJ1?=
 =?utf-8?B?YVczUHg1OGttL1JOMDRjcU5MS0NCZTdNYWxoYWlHc3Q0Z3dlU0lKN29YQnd1?=
 =?utf-8?B?RnZmRWRnbFlPL0FiS3RXS0hnbE5BMEErYnNLYVFLYVRsZzF1VWx2MkluUjNl?=
 =?utf-8?B?TkxxNTlZTkpzV3lDTXE5WWp4YjVJUUZlVDhUd1hVWm9sd2RWRmovQ3VCRHNP?=
 =?utf-8?B?OWpxR096WlM4YW5laGk2SkVTbHhmWmE5dS85V254SDE1OENUTVhQTG1zRnB6?=
 =?utf-8?B?TUN0UzR5bFVjL1haMitXZ2luUHFBWVZ1UTF4eHFPd3FMTkt0VUVRMnZLNHVH?=
 =?utf-8?B?aGZvbDJodEFOQnlqREMyckVKd0VENUhoZlo3VlI0R1dBNzNDYVhwMEExT3Ft?=
 =?utf-8?B?VmpCOTRNQmFpN1dMZVJwelllSEp1YXRUdDloRTNQb0U0V0R4V1ZiL3Nickxr?=
 =?utf-8?B?Y1hjOFJTa0dRWUZ4ajluVTN0MmtpODVKaDd0ejRSZXRsck8xbEVZNW5lRmg2?=
 =?utf-8?B?TldQeThRV1dtcGE4cDEwZFhkNXczUjNEYTJiNndaYitWMXhRK3U2UkdOWHZZ?=
 =?utf-8?B?a0s2cG5ES2NkQzBFTFNGVi9VUUhTck1oOWdGY1FlWGxVM3hsTlBGSXdQMkE1?=
 =?utf-8?B?Z2FjclJoeEwvNEM3aFJWaW1PYjErQ0xpcGJNNWhhekNMUWlEVXFVUDYwRXJR?=
 =?utf-8?B?aC9zeDhIbzFHMkdiRVhtZXNmNEJtRFp2U2I4ZTNrNHFpWEk4cTN0eGY2M0Qr?=
 =?utf-8?B?Sm5qWldpVVE5YVRqMXNnZ0JmaXJ3Ti9MbmdSVG8wMnE4Q3NyL3NPdnZIdGpR?=
 =?utf-8?B?K092Z0J6bUZjSm5nZW1tejVhRW5CWlk4OWVWL2NoRmcrWG9hTW9hM1llUXJ0?=
 =?utf-8?B?N1REeEZRWDBFaGNQenpjN3ZjR205R3ZkaFA1WWxRSG1sZmhXWmlDQzYvUGZl?=
 =?utf-8?B?ZkE0MnpzQXhiaks4c2kzN0FQOEhmcFRxb2pBc3N0dElpL0V6Uy95aXhLZmFw?=
 =?utf-8?B?N1pDN2grVmp1M3I5UVRrUW1TR3hiR3hSUVlXTHVmZkF6SHhkcXRzSml2RGFa?=
 =?utf-8?B?aWNRbUU0UWRMekpUWk05QU85dGZxYlNjUk9JOHV6bytUcXJXRjExQUMrSmVj?=
 =?utf-8?B?YzFCK0psRndDb25DeVhPY2ZZaVRCN1l0MGVUU2tWM1o1KzhGQWlWTnFCKzVi?=
 =?utf-8?B?MkkzM3JucUJ4QmZnczBGeUFoR3FRUFIzV0lTODQxQ3B0di9xdTY1b2ZuT1VQ?=
 =?utf-8?B?U2xmbjZZbU56eGhRMmFUTVpjUHg0MExVbExYSzR5R3RNVEVEWFluZHFSbjls?=
 =?utf-8?B?MjIxbmJYdmJRY0F6SzlGMHgzTjVGdlRiV25iNGxqVFdQOUtLUktFUXlUZGx5?=
 =?utf-8?B?SjU4alJYTEcwZld2cTcyZHMrVUZkTHpOdUFWZW13OHdIWEpvaFRueUUwL1Fi?=
 =?utf-8?B?WVZZaVorZ1FOcDFpMlhUMFp5L3ozWVEvcWNraC9aRTVNeG9zZUVvUDA0MzZ3?=
 =?utf-8?B?amNaODRIYy8yZktJVWtxNjRWYkYveVZqbUdKbFlYNnR5ckQyQmxOWFUwNGkz?=
 =?utf-8?B?YzcvWnZVeEdtUU02ODNvRXFHL1dXV0lmdEZZWXVvZ0ordWErZnlMMThKK3dB?=
 =?utf-8?B?aHlLTjlpTEk1dkVxOEY1ckpVZ1FUUnFCS2VvdFhKNkJSbjB6L3dxeXUyd1lN?=
 =?utf-8?B?M3VTelE2R2dUejNHS0VGdkZCa2xKM0tDUllETk80SXNGb05oaUlSaUJHUXVq?=
 =?utf-8?B?QWE5alp4b0V1M0JhbVcwTitpdndNZkJianJQeGVCVzZtVEQ4TG84Q1prd0xn?=
 =?utf-8?B?RkIveGpjbnM3VlkrV0NxM0EyN0dMZGVDbENSYVA0dmdZR1hETlcvQT09?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 420c3beb-13c7-4f9c-3df6-08de75eaa5c6
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB12038.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Feb 2026 10:26:19.9151
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: omBY3DHN/yIGEGE2b2UHnCpzkNwgNEwJOaRKLhllYAQOcdh4jhE4dxh0E6ZpNK1epYBaNb8g1awT2PTCsxLfKnx8PDKECsHu/kNPeEH+mPM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7686
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 27 Feb 2026 10:26:30 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9007

Hi Antonin,

On 2/26/26 3:00 PM, Antonin Godard via lists.yoctoproject.org wrote:
> Add a simple script that can be used to fetch and format the
> releases.json file from https://dashboard.yoctoproject.org/releases.json.
> 

OK but why do we want this in the tree? It'll still be regularly outdated.

I understand not wanting to rely on a network connection, but we already 
need that for the bitbake's object.inv we download... so this ain't that 
much different.

Then, it's never outdated?

[...]

> diff --git a/documentation/tools/fetch-releases-json b/documentation/tools/fetch-releases-json
> new file mode 100755
> index 000000000..d06a1428f
> --- /dev/null
> +++ b/documentation/tools/fetch-releases-json
> @@ -0,0 +1,30 @@
> +#!/usr/bin/env python3
> +#
> +# Fetch the releases.json file from the remote endpoint and format it.
> +# Copyright Linux Foundation
> +# Author: Antonin Godard <antonin.godard@bootlin.com>
> +#
> +# SPDX-License-Identifier: MIT
> +#
> +
> +import argparse
> +import json
> +
> +from pathlib import Path
> +from urllib.request import urlopen
> +
> +
> +def main():
> +
> +    parser = argparse.ArgumentParser(description="Fetch and format releases.json")
> +    parser.add_argument("output", type=Path, help="Output releases.json file")
> +    args = parser.parse_args()
> +
> +    with urlopen("https://dashboard.yoctoproject.org/releases.json") as req:
> +        releases = json.load(req)
> +        with open(args.output, "w") as f:
> +            json.dump(releases, f, indent=2)
> +

Why not updating 
https://git.yoctoproject.org/yocto-autobuilder-helper/tree/scripts/release-parser.py#n134 
to store with the proper indent already?

json.dumps(data, indent=2)

Then you don't need each consumer to add the indent.

Or even better... why do you even care about a reviewable diff? The diff 
doesn't matter, it's the file itself that does.

b4 shazam the patch, run the script locally/download the file, check 
that your git tree is unchanged, merge the patch?

Or even betterer like I mentioned at the beginning of the mail, don't 
even version this file to begin with.

Cheers,
Quentin

