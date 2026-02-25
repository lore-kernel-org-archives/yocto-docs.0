Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0CF05FD3763
	for <webhook@archiver.kernel.org>; Wed, 25 Feb 2026 14:16:24 +0000 (UTC)
Received: from DB3PR0202CU003.outbound.protection.outlook.com (DB3PR0202CU003.outbound.protection.outlook.com [52.101.84.65])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.45955.1772028976544967110
 for <docs@lists.yoctoproject.org>;
 Wed, 25 Feb 2026 06:16:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=SdycJGHj;
 spf=pass (domain: cherry.de, ip: 52.101.84.65, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hc7J/dyEibe8r0Boy+H/pEzcEcR7lKT/bfnEGZDhOyINtQVeJNRhdV/FBXG7ee+Rs05bEEtVfGwRYX1WqWMyk4PEXBL8pWinAMzS1m5P9OlSwGTUqE5jDDdFH5nIXYlSGKFYGxQn971beRa5CTVg12KVsLZAsvlJxyWQuPNjsIEXwWwKykI4fYax6/lbrh7cOTwC+d53TW9I30moQOfC6KcBtNJqQIOb62aWONup/7E/xDPZ0DPfDjg5MwtDJgSGH/OVfkJE4DsfFtrB3Gt0MJRMhDTy8u8H5CVXFfimNlzSi2/z2n8Rd4uRJclxkrRHgvKQDZNz323pnBj0oSA5Kg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UTrpzUSL1C1O0hGHaWzUBFjPGK7D+8V6NbTKyWFT/sY=;
 b=ufo8mkDZ1BSylwY+Cu6NI+jWcxJyfNXISFY1uEKw/yRDxfBdjUKVT74nzLgVpTR+bQWzdz0i+BqZqRIeL8CWkzdxVqj3M2dpAH5MJGYxyQSHedqHAvAlxuanGhI8H8GjHF54xRoPz/P4+u8v4I/CCqV2Zqtr4YjU3IcYCINYvUpilZZRhVwbeukz0K2PSBgky60CdErVc0QXnwRyvsuXWYETtXyjNtlWLaS4LthgN5wAK8YoJI/aoGBV609btw7vAouYiZ4Zj0gMhrn6FKRYeZcpgYETj2TkGnAQ4Woc3mBEWN7nF/3ZELAtxlOUutqwvga+aKgIUvUL2TUalmEkgg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UTrpzUSL1C1O0hGHaWzUBFjPGK7D+8V6NbTKyWFT/sY=;
 b=SdycJGHjmqwuUbkfkLFNxZA4ZMabZRBHcIKa+IPwM6c5zGKPIeyXNws29c0s+bTzP+sAuI09r72CuO/Edgd0pv4yYD0vAiohSEP3wfOa+bfrcNHvaU40HAA7FUuK5/nQbrv2Hi1fm0+SSA9VySkH34sMqSL42BytYS/s79w+Yz0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com (2603:10a6:150:2be::5)
 by PA1PR04MB10651.eurprd04.prod.outlook.com (2603:10a6:102:483::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.23; Wed, 25 Feb
 2026 14:16:12 +0000
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::6c04:8947:f2f0:5e78]) by GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::6c04:8947:f2f0:5e78%6]) with mapi id 15.20.9632.017; Wed, 25 Feb 2026
 14:16:12 +0000
Message-ID: <502a9603-d92a-4ed1-8888-f92ea1bab43f@cherry.de>
Date: Wed, 25 Feb 2026 15:15:56 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH 1/2] set_versions.py: build with versions from
 releases.json
To: antonin.godard@bootlin.com, docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20260225-releases-json-v1-0-fee3f01b9197@bootlin.com>
 <20260225-releases-json-v1-1-fee3f01b9197@bootlin.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20260225-releases-json-v1-1-fee3f01b9197@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: VE1PR03CA0040.eurprd03.prod.outlook.com
 (2603:10a6:803:118::29) To GVXPR04MB12038.eurprd04.prod.outlook.com
 (2603:10a6:150:2be::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR04MB12038:EE_|PA1PR04MB10651:EE_
X-MS-Office365-Filtering-Correlation-Id: 1ced9f81-e27c-4ce6-9b13-08de74786dc8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: 
	xUo5YLRd0bSKe6RpQqH9h/iODsg5T2VNAz8wY6LLlUrZQJjwcAJa9H/JUp3FhGCXvNtDgUX0ATBEegsWG7BKikYvXkNNDM/8lHqUveyNea+dPLPiuEazjG5gi9OUD2Jhl+pm56AR0SEMKdBSoCA84tWZJ0oevQDAUa78bYdu8SXt7O/oae7bpLEuAzP60OpfK+PrfTZOIqbxir2ldBikuAnFicZ9oREv5cRzQTd3saxrcdSmviniw1khcLR3b3743auIZuZ7DTSNOJFWGE4KIKt89FYoTDYl3EW5QPErSahzs9SArTEaEn3+CVzLGGo4cO+eCNquw3gywkRuwkpvyPRUouTZ8Lj2Kucz5Y2KpcLR5qZ1vBZdRtRHOJ8a0LIF9t/ScaFj1wLGLeDsFJmVWuyPGs04gYG7UcdxlunDKJP/ykulRlULLXv7dWnoyoVpQFsgWVuBQZuElr0nwk4kTVQi2675oQRoywcBo9Tuoq0VAU7r7dggzmw49BxW1BeOdIgVSlA3qjYuaEn9VKTo5QwXRSlB++5/fBrvxERZrMi0WkQORVVFyUx4w+S4QUZ4V1fAmJIlvPJ+8AKtvXhLTACqokMdl0FpBDfkOVbnyab0c2rKGFRfcsONatlMbNA9n0AWxhjExqgi03KH1oMrYBX0iMJyIGBpX3DaIcWlgPBASXVOPTtn7dZniBtd5P6w
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB12038.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?Mi9VdGFuNjhBOXkrTVFEaDNGSkdHL0k5N2EvNGFPVUF1OEJrY1JzVzR6L3Zu?=
 =?utf-8?B?bkMxUFl1K1Fkcjcyam04elJYQnBxeWErWUM5L3VlS1lhdUdNMU5jdVVHaFZW?=
 =?utf-8?B?ZCtFOXQvMGZuMWhxbnRMMnVjYmtvQ1pLSlgxWEcwck9NcHRMcmJDZXBBa2Vk?=
 =?utf-8?B?Kyt3bkFDNjBhMkY2c0Q3SzBmUDI2N242WkVIV1o0K0ZxZ3VGejVGQXgyMUpo?=
 =?utf-8?B?ZXo2YktTckpkZnQxS1ZLQVBWN0RlamVTRVZRODdXK3hmWFRYcGdTbjlTZEZa?=
 =?utf-8?B?KzdpYUhKUm5iZ2I0N2x4Q2FYQTBubFBWQmxSQmxWbGRMcG9NOC9VY2VIRENp?=
 =?utf-8?B?Slp5alhMeVZFTldzRkh3S3E4M0Fyd1B3eG5CQ0oweUM5TnQxYmhJdGZPOFZn?=
 =?utf-8?B?dituUGVGMTRDOGthWEZPY2lDMVBueGFIMFVoZ3g3NWRTb0E5cEtpOHNEYjFW?=
 =?utf-8?B?R3BwWGFuRjBiS1N4RzladXRSSEJUWVcyYVo0S0E2eldEc3lHMGhPYzJQT2Q2?=
 =?utf-8?B?N0dLNnZPZ0wwWitVWVBKMWpRaFZrcTk3RUcrSzdUZW5BcHM4QldMNHZuOUNa?=
 =?utf-8?B?cXVSM0dOWGpkcUdsRDhUdWtkYlIremtkdHhlMXlYNWpUSHhRaWltWDR1Vmlk?=
 =?utf-8?B?ZDhUL3UyS2swdTdCanV6NFhXaFkzdExUSzhVSlJOSUdoaVMveTNvQjBCbTVu?=
 =?utf-8?B?cHVQYWpveFhKOGtDOHppNVJremdPdWNhUE9Jc2VJUlBlL1ZRbWZFZURRNVRm?=
 =?utf-8?B?T2w4MERUdG1iUDg4endxZWw4dHFDR1plMWhwZGtQOUlrNFlCN0FrallaVzIz?=
 =?utf-8?B?bUpKMll1YnJmK1hKd3ZxMXpmWUNwRmV3dmpFRjBvTnNlUVlZUCt0T29uaXdU?=
 =?utf-8?B?Z2srMFk3eWQxYUV4TVlyTmZxSlZxZkdXS2d3dHA3VVpjdlE5Z0twampmckYv?=
 =?utf-8?B?RVZzUk5VUzRBVFpGeUpvK0wrZmtQYzZ0M3VJa3ZBb01DNXNCNGdvYkpNRXFw?=
 =?utf-8?B?cFRUdGRlSXZXT3ZqdTVDeTUwN0VxbmRPc3dWOEgxSEZ6M3Z0T2MwVXZ5bVRa?=
 =?utf-8?B?OXFhZ3FibU1YZ1BMQi82bDJrZHpXaTFNa0lmS003VnVDS0tlUWlBdUduZlN5?=
 =?utf-8?B?azBOVStMT29wTTFUS1MxMHVKcnNreXk4SjRLdUNoR3V6ZzYzdi92MkhYZVhM?=
 =?utf-8?B?aFQxbHYrcnprcmVuVmhKdk82MGVNcFErOUFGa1pSc3lMUUZjbFFBajA3ZXRU?=
 =?utf-8?B?TSswMUZSa3NtZFhEOU9aand2djhkVldONHNNTWFJamYvVVo4Y01RRER5bTYw?=
 =?utf-8?B?UVExZU5veTJ6eExBTXRqS0tGakRZajVpRFErUEkzaW8rbVRVZklNMUhROHdl?=
 =?utf-8?B?UDFUVkhodTc2bkxWVVBKN3d6QnZSQjBxeENldEFZOFRuKzd4T2I2QzdicUZU?=
 =?utf-8?B?aVNEQ2xDbjlHS3Z3aE9xeGk1U1o4L3h3MFpWZUhKbW51N1FodnArNHJDckd2?=
 =?utf-8?B?eW9qbS9mcUhsWjRqbnllbzI1NUJhRldMVFpvV1FMTVBiMVN5bGVZNUVOUkZk?=
 =?utf-8?B?SzBQTjJtR0ZoMkxCNkU5Z1Y1MGJ1REs4dDNnYVdiZzlGV0NwKzh6VEFOZnNH?=
 =?utf-8?B?cU9HZVJNak1BQ1pWT0pzOTZmRGJhM3hOL3ZvT3E2ZC9RaCtjVTZvWm1JbVlh?=
 =?utf-8?B?TEQ5MEdpaEtNY0RXeU9vTjVvLzRnQWoyNFdTU0pKYlRwc2Q3cU1Ia3ZKeVZZ?=
 =?utf-8?B?M25MTlB0RjVyaVhPaWU5Y24zN0xzL0NweWJlVkxCa1IxdWpUZVpkRW5PSUVy?=
 =?utf-8?B?Q09SVmtNTURoRmZyV0lFZWN5Wk13Nm1USWtBWmtPK2dsOVhIMHpMNGdWVy9Y?=
 =?utf-8?B?OHNHc3V5YzQ3RXZtM0c2RC9HQ3BMYVlDVnU0a3VwTksxZnJPMDd5Qk1tTFAy?=
 =?utf-8?B?TVN4UEp0M21vNjZIWVpFVFhzcis2SzJKVzVaY0tZcVZtRWNQVXovV3VXaWZ1?=
 =?utf-8?B?T2lOSzlIRU03Ty83d2lRdTlJZTkxYmwrUVBPb2ZSSnpRLzVuMnJ5VGtRekZE?=
 =?utf-8?B?bXpqVzZpYnNaWnZlSitXQVNyVHJOM1Fiekl1TU5rcUNGSDZpeUpFYjE1S21S?=
 =?utf-8?B?bjlBWFFrQndsTXZBOGVnSFBrY1VpZzRzcjZSUkFkSEpoMFZ1bG5qdlVOeUJt?=
 =?utf-8?B?SVJTTjJHclBORS9DUWViUGdFckN0TEZNTklRSDg0d21mbUFWRmNZaHdVVXND?=
 =?utf-8?B?NGszOGxBOTgzSW1VMUFXTmh0WHlVbVViVVZNS0pIbDRVb1RjMkhteHNoSk9p?=
 =?utf-8?B?aXB6cFVRdWMwdHJOMUdrWFN2dFFESEdDajFDYTNoTFlySFo1USt0UT09?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 1ced9f81-e27c-4ce6-9b13-08de74786dc8
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB12038.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Feb 2026 14:16:12.0836
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Gl4WUFiph+0tCQWFxyeKILGazIAuVgRHSn0WtMV1vHAH564Y/SxPW3TPwQTJ8Bb/hmzyVTGK0mxOBtZdffdePCTVjI0JwSHMUqvmPm11qxg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR04MB10651
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 25 Feb 2026 14:16:24 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8991

Hi Antonin,

On 2/25/26 1:05 PM, Antonin Godard via lists.yoctoproject.org wrote:
> Build using the releases.json file which can be obtained at
> https://dashboard.yoctoproject.org/releases.json. This file needs to be
> updated regularly for the documentation to be up to date.
> 
> Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
> ---
>   documentation/releases.json   | 622 ++++++++++++++++++++++++++++++++++++++++++
>   documentation/set_versions.py |  63 ++---
>   2 files changed, 646 insertions(+), 39 deletions(-)
> 
> diff --git a/documentation/releases.json b/documentation/releases.json
> new file mode 100644
> index 000000000..0d2d51fa0
> --- /dev/null
> +++ b/documentation/releases.json
> @@ -0,0 +1,622 @@
> +[
> +  {
> +    "series_version": "6.0",
> +    "original_release_date": "",
> +    "latest_release_date": "",
> +    "release_codename": "Wrynose",
> +    "latest_tag": "",
> +    "releases": [
> +      "6.0_M1"
> +    ],
> +    "status": "Active Development",
> +    "download": "",
> +    "series": "current"
> +  },
> +  {
> +    "series_version": "5.3",
> +    "original_release_date": "2025-11-26T17:14:07+00:00",
> +    "latest_release_date": "2026-01-09T15:00:43+00:00",
> +    "release_codename": "Whinlatter",
> +    "latest_tag": "5.3.1",
> +    "releases": [
> +      "5.3",
> +      "5.3.1"
> +    ],
> +    "status": "Stable Release until May 2026",
> +    "download": "https://downloads.yoctoproject.org/releases/yocto/yocto-5.3.1",
> +    "release_notes": "https://downloads.yoctoproject.org/releases/yocto/yocto-5.3.1/RELEASENOTES",
> +    "series": "current"
> +  },
> +  {
> +    "series_version": "5.2",
> +    "original_release_date": "2025-04-23T15:37:39+02:00",
> +    "latest_release_date": "2025-09-12T16:48:58+02:00",
> +    "release_codename": "Walnascar",
> +    "latest_tag": "5.2.4",
> +    "releases": [
> +      "5.2",
> +      "5.2.1",
> +      "5.2.2",
> +      "5.2.3",
> +      "5.2.4"
> +    ],
> +    "status": "EOL",
> +    "download": "https://downloads.yoctoproject.org/releases/yocto/yocto-5.2.4",
> +    "release_notes": "https://downloads.yoctoproject.org/releases/yocto/yocto-5.2.4/RELEASENOTES",
> +    "series": "previous"
> +  },
> +  {
> +    "series_version": "5.1",
> +    "original_release_date": "2024-09-03T10:35:52+02:00",
> +    "latest_release_date": "2025-03-07T11:58:05+01:00",
> +    "release_codename": "Styhead",
> +    "latest_tag": "5.1.4",
> +    "releases": [
> +      "5.1",
> +      "5.1.1",
> +      "5.1.2",
> +      "5.1.3",
> +      "5.1.4"
> +    ],
> +    "status": "EOL",
> +    "download": "https://downloads.yoctoproject.org/releases/yocto/yocto-5.1.4",
> +    "release_notes": "https://downloads.yoctoproject.org/releases/yocto/yocto-5.1.4/RELEASENOTES",
> +    "series": "previous"
> +  },
> +  {
> +    "series_version": "5.0",
> +    "original_release_date": "2024-04-15T17:39:29+02:00",
> +    "latest_release_date": "2025-11-14T18:10:02+01:00",
> +    "release_codename": "Scarthgap",
> +    "latest_tag": "5.0.15",
> +    "releases": [
> +      "5.0",
> +      "5.0.1",
> +      "5.0.10",
> +      "5.0.11",
> +      "5.0.12",
> +      "5.0.13",
> +      "5.0.14",
> +      "5.0.15",

Something's wrong here I guess. This is not a properly ordered list of 
tags and I would assume someone at some point will make this assumption 
(e.g. how to get the latest version in a series? I intuitively would do 
releases[-1] but this won't work here).

How is this generated?

I'm assuming you are lacking

--sort=version:refname

if you're using git tag --list to generate this list.

Cheers,
Quentin

