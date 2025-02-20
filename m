Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60764C021B1
	for <webhook@archiver.kernel.org>; Thu, 20 Feb 2025 16:41:37 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (EUR05-DB8-obe.outbound.protection.outlook.com [40.107.20.73])
 by mx.groups.io with SMTP id smtpd.web10.1456.1740069692668868640
 for <docs@lists.yoctoproject.org>;
 Thu, 20 Feb 2025 08:41:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=XGGyEOXm;
 spf=pass (domain: cherry.de, ip: 40.107.20.73, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ASPU7TVr0tNcqsOXxSDjod9LALszCDKbjnrUfsOX3D8HYK5+SL1dzoroXS0fuxYtKjeyv6V1cGo3Lsa8mK+CN8lhohMyFSqRmSqBx8wZpOg2EH0iY/do5Pg3YCflm9xGz9yWaBb/S03iy4hH/wZA63qQEBZqw7mX/jLeWXzOjywkqdLVs5LBjd2DIbkuZxfrFz77T9+ceuAmQOnYSgFDAWCUW0m/tQUfOueaP8tb+7pHT2NQ+nz3TFyl8EvP8coqJRfLsW0ptvpzhTnpP5JzKThsdFLHdXwoZ0q1JlWNzKtEK8he5I/3dcRbrp2quL17uMqPNNF3x0tRen4WeDcmeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Z4ZgK/17JihdECzjrP3L6VYOvOfS1sOEj7SFxJC1AIQ=;
 b=MrzXOkUcdjplzwjPCQ26hklbPwt9Q7mkhC568OX8qscdH2442ws1UL5LKyXWCZCnK0w75iGKugZxa9O8JxvLdg7G75/z4Rgb+GTc/93CtphQJdMsEVXm2l+9fmpQODyFaMvwNqY7AVBB5q35Zu3YlqrdqE2UOJRHNQvHh98jnlrBaiIpjp2aN5gBpNcdKPIgCSSuJjiH2CZ37UFC5jSjspwe03QHipvv2oUVIEVgiwVPBeeFIxv8oG63huS+GUjXiNlG7rB9w3YdqqeyT5giKqZVte7WkWBK0S7WANH1UBUUjEuolryMckVHi5t85cizQBEWD27tYRgY1hm2faHR1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Z4ZgK/17JihdECzjrP3L6VYOvOfS1sOEj7SFxJC1AIQ=;
 b=XGGyEOXmTfGs+VG+wRxod2C+o1/hQ+MJ+orNOJsYijFUDdq9NCOTrH6C6TZP2qpwTKYuCcgmTTWjOja4xJt48WtbqeSCy7kW5qJE5SPaVauYCD/m9cC76q+X84lQysbQfB85XZaVTsgCjWVL2pKSt6Ttw7BMwApt5JjtKgLHhq0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by AS4PR04MB9364.eurprd04.prod.outlook.com (2603:10a6:20b:4e9::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.13; Thu, 20 Feb
 2025 16:41:10 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a%6]) with mapi id 15.20.8445.016; Thu, 20 Feb 2025
 16:41:10 +0000
Message-ID: <f4db28cd-1701-49ba-8c90-938128fe61df@cherry.de>
Date: Thu, 20 Feb 2025 17:41:09 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH 6/6] ref-manual/variables: improve the UNPACKDIR
 documentation
To: antonin.godard@bootlin.com, docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20250218-overview-figures-v1-0-75d23b5e7a88@bootlin.com>
 <20250218-overview-figures-v1-6-75d23b5e7a88@bootlin.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20250218-overview-figures-v1-6-75d23b5e7a88@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR09CA0121.eurprd09.prod.outlook.com
 (2603:10a6:803:78::44) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|AS4PR04MB9364:EE_
X-MS-Office365-Filtering-Correlation-Id: d2e9ad56-9740-4c73-e105-08dd51cd61c3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7053199007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?c3ZJcGp1MXVvb1RNdEtIdWtESW82SnF1WDVEWDVRRlc5aVFob1VvSDVGbW9Y?=
 =?utf-8?B?d2V5amUvSGdjRGpIcmkwY2EzSlFqRkZlMVJuOStWNHY0akpzU0VwREpLTzdB?=
 =?utf-8?B?OFFNdjZlQ3gvVkRPWUE1bEdPUy9NTTZvbjBpMHNGR0JmbVB2VWtHSVVDWFZH?=
 =?utf-8?B?aXlUc2Y5K2hpK21CNzJHNWFjZ0RCdDhIRmNXeEIvd0plMFVuSGhhelVoNXJp?=
 =?utf-8?B?bEttd3ltY25xOHUya2s3cmVlY0NxbHkxMmw1dkFMZ2VlVnBOQUZLODdDTXFz?=
 =?utf-8?B?cnFnUHRSNWV1RmRKWnlNdjBqc3d0ajNLcTlmUXl5aDYrY1N2WDh5V3ErUElV?=
 =?utf-8?B?OU9rd3lraXJUektSbE5XTW16ajRScnJOdTNiN0MwMkUwaGg5eHJSSkdraGR1?=
 =?utf-8?B?czk4L1IxRE5XMVZhZGU1UXRJYlpNNVVJZlp4eVAwRTh5bUFlQ0xGTVR0MHBj?=
 =?utf-8?B?djNYV2RrRERRTndUckk1dzZLS09vN0pTMkdDUEhIZG85bFQ5NmNFQWVKTTN1?=
 =?utf-8?B?TEhrWTg3SDNHbjhjcms4Qk1QZlNPTzNrMjVQYVcxdHBjYWw1aU8xb2t2b0RG?=
 =?utf-8?B?YnVHS29JcE1RUU5CVGVaMExFTEQwWVZBOUgvbWRBVzlFVVVSNmtQQXpOdzVK?=
 =?utf-8?B?T0J3TU42OGRYLzhZU1hhakFUdG9CRVZpejNwUk9laXFkd1lqOThmUzFEMzZm?=
 =?utf-8?B?c1NDemRTQVo1cWJxa0xaVlU4anl0dy9Kcld1cVJFdlNFYWFGZ09UUzhXZ3gx?=
 =?utf-8?B?WFNnc3BzRXp3cHJEOTFjMFV5OGYzcktNbWVKdFBKYUVGQlFLNFlhQ2ZsSkhB?=
 =?utf-8?B?QkpWekFvUzJpQ1ZmZUJaZ1dycktBMmRhTWxZc3ViOUljOEN3OVRYd2pGTFJ1?=
 =?utf-8?B?K29EY3RScDB1MTJ4UjF6RGJSRkNJRkdEUE11cUNVR0pObS9jQ2pncTJPUSsx?=
 =?utf-8?B?VzEvSVc2QVZKYVhOMU80SUNNS2hRT2xOQWh1YkdXRzdXRjhneVlrb1ZKTHhx?=
 =?utf-8?B?Y25rNTNDMVdOZEQ2VWNQWnpndG1LUXJTTXpHK2dMVGpxV3hIY3V3aVd1Tk9Z?=
 =?utf-8?B?cEEwLzlibEhUWnhmZW1vWmJlcHcvMEhWbHY3WGdjUUVUQXJ2bUx1VnJFMUZL?=
 =?utf-8?B?RElhaEsyQWxiVFpJbm5wVnd3UDNGM3kxL0xxWGUrUDVjN2hDaSt6Zi9uYW5L?=
 =?utf-8?B?TlZwc0ljL2kvekVTZ3pZUU1yK25FeDNkM254S1V0WDA1TWdrcGNPdExxczJz?=
 =?utf-8?B?YlVqcVZJY014QllUZElKU05GTysvL0VUWHJlL29zSWNINE1nanNCMFhCYVNz?=
 =?utf-8?B?azZmKzhWT3N4K0Q2ZnRwbGF4aDdHaiszcHNDSzVtTGdLa3doOTE4eXJGSGtS?=
 =?utf-8?B?eFlxaGFhV2lPUi91ckg4M2NTVDVZSmkweVhUSTRzSmxWcEhTUkpHZE5ab2xX?=
 =?utf-8?B?ZUVUYnp1eit6MzJlaXhsMUhlMnpMZ3BaQXRJUDRlN1lrYnc2SGN1bVVIbloz?=
 =?utf-8?B?VVdXVDRld2VJbzB5dlZoNmRsNk0zSjdBQ0RqcS94K3o4c1RDSmhMOXhSVmRx?=
 =?utf-8?B?QnJjb0pWdldSRDRYS2h3MmVjTmpzeTE4bUpKUWorUHQwZmhHZzAyY29BQ04z?=
 =?utf-8?B?K1pvL1RuUkRrMnorRzhycHVtdEpKSC9lR0xOL1FmbnU3c3F0WEVtMEpRa2li?=
 =?utf-8?B?aDNDekJtc1l5QTJlWkJmQ2FkS0ZYRFI2d3hBUHQ5bXlmMVNUNDhkWU4wSFVp?=
 =?utf-8?B?dnQ1VUwweHR2cWtzbGN2MHNUZnE3WFNGdy9ITGhsazk0dlhhQ0hzenJySTJM?=
 =?utf-8?B?WGxwb1JPbkg0U3M3VnNHUlE0SkJxK2hjaWxSRUdEMTVKUytJRkxEd3hRb3R3?=
 =?utf-8?Q?t39rO54eOmkfA?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8897.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?Q3ovaUNab0djWk5hNE5GbjZCQk1yMG04ZzVxaytsTTRocU43VGErQ2thRENB?=
 =?utf-8?B?Y2xTMkJYeTUzNTNHcHhYNHRhUnFOMDVydHY3TzBJTmZPNnRXeWxUV0lKNjJK?=
 =?utf-8?B?ZUs4TXVjSGI3aVdWV3lJQmFOYmgwSHpEM0YzNy92MjVIZW1VSUNGSVQ5VWxl?=
 =?utf-8?B?RmlqZHE5MjEwUGdSUUYxVTRIa1AyWnY2UVRMYS8raDRJTnhMbHdkb0pKOHhT?=
 =?utf-8?B?amNxNG0zMUk1Y3RhelhOenlCd3RsdkgzelJ2MkJhOFZJYWY5NVNKeEp5Y3h6?=
 =?utf-8?B?RktIWW5zOUJ6UDdrQXZGc0FlSHZIaXJEc0pScUR6Z05pdXpmWVJES2VQb2c1?=
 =?utf-8?B?L01GUmZ4UE1aK0Y1QUhlRlBGdExZSENsZ3dqdGxLOWt2VDZNSGcwSjFPZ2Uz?=
 =?utf-8?B?R0lueFRZTXV0WnNmSm5IR3ZEeUhmVklXVW4wR1NtQkd3OXdXTFMrT0VnOU9m?=
 =?utf-8?B?dkp1RTcrays5QW5TTHU2UitKOHRjUUc0bG94OTcwZE82V05tOUMrMXd2UU9N?=
 =?utf-8?B?L29TZTNsL0pZYW9MVkd3VVBKamszMXZtdzc2YTZnZktEeERiL1JHY3QxaXAv?=
 =?utf-8?B?OW54UmZwTjA4OGNySmZkVnFpNjhDeTd3M1IyNVpjUlM0WjZNOXJteUYyeUk4?=
 =?utf-8?B?bXRrSDlOLzZuQ0h0NlNaZVg4OFF2MWN6Umt4MVRBTFNqMCtkYmNsam5BUXls?=
 =?utf-8?B?SEVGYlNaRHpleWtmUG9Zai8xc0pNNGY1L0VabnNFanZmeFY5MzNSRWxPcmJZ?=
 =?utf-8?B?ZTN1Qjhidkc0dDZjZlpBKy90dU5SeTVQV1c2MDlWNG9ZSmFkaTFIYjJzOUFH?=
 =?utf-8?B?VnRyaDd5NU15aEhSRjUrWFYraU12NjZ5K2pWbWZpdU9JRGRWL2Y5bmVQeVpR?=
 =?utf-8?B?UUg0RUM5ZGRCenAzc3A2SUxTVkIzZFFDM1U1ZE55Um5iZnJXVmNEWklUUlVw?=
 =?utf-8?B?T05oMndwL3k3dXowWTUxSVY0WWF4V2RhbTVQN1NUSzJyMEpxa1pRRHFPR2Zq?=
 =?utf-8?B?WHg5L0cxUnUzaWF2cmJGbithKzZiNTVuY0FsTTRNb3JCRXdZcnh5Lyt3Zm0z?=
 =?utf-8?B?U05HcWlWbW1oWHlSZU9uS3A4YlA0TFBXd1JqQW15TlAvVGhqU3RnNU5iZWlW?=
 =?utf-8?B?YXo4Nmt6Tml6ZXAwY3Y5LzBiQXpYQi9WZ21HTEtpMlJ6Y3d3ZGFYeFpYVVhK?=
 =?utf-8?B?bzZ2L0RSK3d6SmlHTGF4TXZ3QWJtekl4amRIekpVd3NhVlV3RzFEVDd5WUdu?=
 =?utf-8?B?WFdNNURFejcwRkxINzBpeS9aaXpDOWk1bE5uMDRpanhBaTg3NDlOYTdVc2gz?=
 =?utf-8?B?RzZnU3N1aGFEN0ozdjNMTkFsYkpJdGpseExNOEtrRXg3Y1hyM1pSRldCSVM1?=
 =?utf-8?B?ZWx6S2NMRFQva2xZYVppbVVZNGRuTFB5N2ZuTUxHeEN5VkNCMk8yMGxaeTU1?=
 =?utf-8?B?Uno5NGxEMTc5TjBnYm5rR25saFU5SnJVMFhRN0RUang4cHVuNDd6ckFLM3hy?=
 =?utf-8?B?NFhmWGhMU2N4NHdMekhtc2VrMVlERHd5eFM3bXNpZGFYaDFmTUxlbnlKS1F2?=
 =?utf-8?B?SkFrVEhUVktobnppUDJ6Zy9yVWtOMEg2ZzJVLzEwRVVucXRSaXJYNFlnM1dE?=
 =?utf-8?B?cGc4VXlFd2lSVFk2R2N5TEhJMmlyUzlwcWs1L2hScGp0cVJQOEYxZ3g1WW94?=
 =?utf-8?B?bkpxaTJMWUFWRU9aSncxWHZaTkdudkpXRndKQ3JxcmdrdEcwWjdyRGV2aDN1?=
 =?utf-8?B?S3JCMFZLSk93QjdVOEdBR2pvbk1mTnBTaS9RUEVZU0pTcHB5Wk5vdFZFSDZv?=
 =?utf-8?B?UW8xWDd5c1NZTTk5RytTTGJxbWk4NDhGRm5OR0tRUWlGL2ZBbWhJMXdzaGlL?=
 =?utf-8?B?b1d2OS9wWE5wdko5NWQ4V3N5c0crOWtxeUxXQTV5RlZBbXVKaDlKalZkc2R4?=
 =?utf-8?B?Z3pGQVptajJSWDJxVEhhY01POWZEa1VnS0dxZW9yUGs2VUFVN1J3bEdXNk5H?=
 =?utf-8?B?TkFDZUNZa092UWZCekVIYmNXRkdYY3ZCdkpWU3ByTExzQ2VWbWY3T1R3N2Rm?=
 =?utf-8?B?Vi9xTjFjNmVqNytQbmwzZ2Eyc2RmVHJDbHVNd2IwbXl1WWY2M1JmR2x5OEM3?=
 =?utf-8?B?cEVjc2wycnlQWjdoRHVJRDRYQWpqdGFJZTI0MDJXMXNQeEVtZC9MZjJmNzRx?=
 =?utf-8?B?YUE9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: d2e9ad56-9740-4c73-e105-08dd51cd61c3
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Feb 2025 16:41:10.7994
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MyRDXg3NFN9SaVtHlUVuqkg8o4KSoHRBTYdv0USLjjOTiYV5Q+CsN5HpQvFBEZVWIusfCUXu95EEZMK3aeS74CUjN4RAn3VS34Kf+pubprE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR04MB9364
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 20 Feb 2025 16:41:37 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6424

Hi Antonin,

On 2/18/25 10:12 AM, Antonin Godard via lists.yoctoproject.org wrote:
> It was clear why UNPACKDIR was introduced at first, and what is the
> recommended way of setting S and UNPACKDIR for a clean separation of the
> source code and WORKDIR. Add documentation for this in the reference
> manual.
> 
> Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
> ---
>   documentation/ref-manual/variables.rst | 39 +++++++++++++++++++++++++++++++++-
>   1 file changed, 38 insertions(+), 1 deletion(-)
> 
> diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
> index adbef69d8f39d33be87c5db6688a807156540410..d970fc21f69fe35830a9d6b5a28da7cb257c0709 100644
> --- a/documentation/ref-manual/variables.rst
> +++ b/documentation/ref-manual/variables.rst
> @@ -10035,9 +10035,46 @@ system and gives an overview of their function and contents.
>   
>      :term:`UNPACKDIR`
>         This variable, used by the :ref:`ref-classes-base` class,
> -      specifies where fetches sources should be unpacked by the
> +      specifies where fetched sources should be unpacked by the
>         :ref:`ref-tasks-unpack` task.
>   
> +      Although the default value of this directory is
> +      ``${WORKDIR}/sources-unpack``, the recommended way of setting
> +      :term:`UNPACKDIR` and :term:`S` is::
> +
> +         S = "${WORKDIR}/sources"
> +         UNPACKDIR = "${S}"
> +

Mmmm I think this is an issue, because we then show a non-recommended 
configuration in the SVG in the previous patches where UNPACKDIR != S.

> +      This allows the source code to be safely unpacked and patched in a
> +      separate directory.
> +

I think I know where you want to go with this, but the first time I read 
this I didn't understand it. UNPACKDIR = S in the example above, why 
does this say the source code is unpacked and patched (implying two 
steps/stages) in a separate directory then?

I think this is because we used to put everything from the fetcher into 
WORKDIR and there were unexpected leftovers between builds and UNPACKDIR 
now is a separate directory for the fetcher to put everything it does 
in, instead of WORKDIR?

I'm not sure we need to document how messed up it was in the past rather 
just what this does now?

> +      .. note::
> +
> +         In some cases, the :term:`UNPACKDIR` directory only holds the sources
> +         temporarily. When the first directory after :term:`WORKDIR` in the
> +         :term:`S` variable is matched in :term:`UNPACKDIR`, the directory
> +         in :term:`UNPACKDIR` is moved to the :term:`WORKDIR` directory.
> +
> +         For example, let's represent the :term:`UNPACKDIR` directory
> +         for the ``foobar`` recipe after extraction as follows::
> +
> +            ${WORKDIR}/sources-unpack/foobar-1.0.0/...
> +
> +         And the variable :term:`S` for this recipe defined as::
> +
> +            S = "${WORKDIR}/${BP}"
> +
> +         Where :term:`BP` expands to ``foobar-1.0.0``.
> +
> +         Since the first directory of :term:`S` after :term:`WORKDIR`
> +         (``foobar-1.0.0``) matches the directory ``foobar-1.0.0`` under
> +         ``sources-unpack``, the latter is moved to the :term:`WORKDIR`
> +         directory. The final location of the source code will then be
> +         ``${WORKDIR}/foobar-1.0.0``.
> +
> +         This behavior was added for compatibility for recipes that do not set
> +         the :term:`UNPACKDIR` and :term:`S` variable in the recommended way.
> +

I've read this 5 times now, it may be too late for my brain today but I 
am not sure I got it :)

Let me try to reword it just to make sure I understood/got it right?

If UNPACKDIR differs from S, but the name of the directory (dirA) where 
sources are unpacked in UNPACKDIR matches the basename of the directory 
used for S, then the content of UNPACKDIR/dirA is moved into S?

If that's right, what really happens? Is UNPACKDIR variable modified to 
point to S once the move is done? When is this happening?

Cheers,
Quentin

