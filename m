Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9554CCD1A4
	for <webhook@archiver.kernel.org>; Mon, 20 Oct 2025 15:01:07 +0000 (UTC)
Received: from MRWPR03CU001.outbound.protection.outlook.com (MRWPR03CU001.outbound.protection.outlook.com [40.107.130.29])
 by mx.groups.io with SMTP id smtpd.web10.21049.1760972458314683939
 for <docs@lists.yoctoproject.org>;
 Mon, 20 Oct 2025 08:00:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=fZjHAuuj;
 spf=pass (domain: cherry.de, ip: 40.107.130.29, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IryAFdn5t6BaE32/6m7Hv6lkZ9YuzQnDagWww8FrC15EUjtQES/FH7378XDadftaD0YNjtYPRaMsc5JvnWs3wPAnoVC3QBCdw7vM2t1Jmx8bP2uR5Paa7VpXrRn00e1EaMktIfZs7QdAh18jf5irHyTWWEYtkihl5dhAnOpfejKDRU/Dc+KzIwJ3n38SETggjWfMNEGGEfhVf0Yc56q7NxjWJ9zYap6VcG1NTO6f99hRA8QcNOBKtezpEHYv0M+akWfrKNPWQIIoL5OcQ43Deh5NtlbJ3/cxW32KiLqsqG/4COKZUks7NoN33Ag6OjE/sUXRq6rQdJDm0E9pTn0UdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2ZoIxstsxs2M3Wx3I3/QYEYxRyVdz13th49LuBocrjk=;
 b=EalzOGad3nWasOouV/FrUS+b3OoLzTBTvI+Yn75hR3osMGwAsERC1WQR+aV1UmZ/MA3t77jKtri09H0nwujQi7AmLeCl9GlfPjT1G+D9JlUNpyedGJGB8nDvTWBGW0B0oZeZB51q7Fo6uA6qltfvpHpdnGCBbppMps+MgUN8Nr5/0YpAm2AkS4oedPRv947K6IyFCA+YVHj6Dvsb7elQkuPs/PT+9cICxA6DCF41ivuL4AiiLXJK0RUUeb0LgqGEEOFFDBFFCKoAm8xDp5KcW3X1vOwjW+LBVmDiB6NOBY6XUSyFUKbZ59UG6y59l9DTZ8QPHQxNVA/HcITCsvV2iQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2ZoIxstsxs2M3Wx3I3/QYEYxRyVdz13th49LuBocrjk=;
 b=fZjHAuujO+wKYeUw2Ob3dDsP4I//LXtu2xvlPT/0nTIlpaa2zdlbw0obp2FQgdMf1pvABi83jFloEE3NZWdSYoKD56gCvdDbzRAKtukE1hO1f/9VmxTZ0DQXhcoTSwqt7C+Eo1fHR5FB+uzQKyZ0+/efPLktcsft2oo3zEanJZw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by PA4PR04MB8047.eurprd04.prod.outlook.com (2603:10a6:102:cf::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.16; Mon, 20 Oct
 2025 15:00:55 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::5ee:7297:93b4:a8d1]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::5ee:7297:93b4:a8d1%6]) with mapi id 15.20.9228.015; Mon, 20 Oct 2025
 15:00:55 +0000
Message-ID: <c9d8f46f-9d92-4258-bc17-443578f03b8f@cherry.de>
Date: Mon, 20 Oct 2025 17:00:54 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH] ref-manual/classes.rst: uboot-config: improve
 documentation
To: antonin.godard@bootlin.com, docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20251014-improve-uboot-config-class-v1-1-9163eea15557@bootlin.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20251014-improve-uboot-config-class-v1-1-9163eea15557@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0161.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a2::20) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|PA4PR04MB8047:EE_
X-MS-Office365-Filtering-Correlation-Id: f6e59a65-a18b-4adf-67e8-08de0fe97800
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7053199007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?SkFsZWlubWdtaVZPZDR6di9Ra1p3ZElpWXVQdEZTeGFaMzdVK0M0Rmp2Q25C?=
 =?utf-8?B?dThRd21LbEsvQ2ozS2RkOCs0aEFqOFA5WHRlOUJrK3N6T2U4Y1c2dk50bEwx?=
 =?utf-8?B?VUo1KzNVWUk5b0gyR3lTNCt2b09GMUtvZFB1TDRDVVBWeTN1eDZNd2x1VEJj?=
 =?utf-8?B?TEZxbERpMlJDNEpMSDBySlBGZ1lERlF6QURDMmtHVXBqUzhHdGp2SVBqK3A4?=
 =?utf-8?B?T1ZNSytHYWh3TG9HQ2hHRjBCM0RhbWo5OUNEV0lQcmxPQ1RZVTNnTWxoSVNj?=
 =?utf-8?B?YWEwVEsyeVNqYnFUVUVYZTFlUlZqTFFIVUY3cXg2VHV1SWZDUHN0RjB1YlJk?=
 =?utf-8?B?WDg3dUhOTHdDNVpQK2wvMXVEZHpUZWpYeWM0bmJBYmN1TXdoZldXeDZaSDR0?=
 =?utf-8?B?Vng5OHc1L0VJQXV5bnZOMFMySDFqOFZOR2pqWWNZekdlb2d6aUhISTN3OW9r?=
 =?utf-8?B?T2VmY3RhWGNMV0UwWCtVLytEKy9VUTJJeER6K3VkQkRiUEtCck1EWUFyVTFH?=
 =?utf-8?B?K3VBSWtpY0tCUTRzQ2M4SGxpdEJrOU03amU0U0c1QmtEV2VlSWNxaDNzRUtH?=
 =?utf-8?B?VjN3R1BvVjZwREZFaWt0NjFnV2pNNEQ1dG5rdUZoc3JXNk5KREwzKzlvend4?=
 =?utf-8?B?Z2NJYkpRWlhZNHR0cm9UWTJVSG1hbFdDQW81dzVGckNCRUlvM0pkbldXR05P?=
 =?utf-8?B?a1BhRkpOdzlzQU5MYmlJdDdRZTNuMzZVZFI5QVBVMDFtYk5SUytodHlQYlNS?=
 =?utf-8?B?TFN6bmF0Y3BzZ1p2RjRhRWJoay9BMjhyelNIV3lkbTYrV1d0eTJENlArOU9r?=
 =?utf-8?B?MFhDSHZvSXBHUHEvZHhBRUZDVlk1MWdJZzNxMThoaCtvRG9xdTBWS3dUSFgx?=
 =?utf-8?B?eXdCdklNLzBVUVpKWVdhTnlPejdFdUNlVEMrZnVxL2ZhOVE1VGIxS0c2Q0Zo?=
 =?utf-8?B?Q0toaktDMGxOTlRMMW8wVkduMXZYTEZpK1orN3N3RkJFMUdLRHNsSTYzNFdJ?=
 =?utf-8?B?dE1MVnlaZStZQ0VZdVpUeU1SeDVMNlQxVkRESzM5VVQ4WnFxN3JVdDdCODFV?=
 =?utf-8?B?T09LaHRHcTh0bEhkWHc3YVJKeG16enRJaGFDR0VaaHBVRFM2NVc1NnJxVW9I?=
 =?utf-8?B?eG9BY3FZSW02Y3FhSlhRTERNU3pyZ0Zjanp5eVBnV09hUER2c3ZEMW5uRUtn?=
 =?utf-8?B?bWZwNnFiSENYYTZCQU1YdkZLeHNaYWhGMDlYOGJGZGpqbXVOTGo1WnBXQUZr?=
 =?utf-8?B?SzV5VzUxaVNWMTU3QjZDdEFKUUZPS1FNakxrbmZORFNrOVlvaFVMWmUxUWxG?=
 =?utf-8?B?bmJLeVcyVjNTQkZLLzlmbEx4cUt2aFhjSGhsNkkwMjQybHV3M0kwMXViUzhu?=
 =?utf-8?B?YWVPblFHMElGejZPR2FhY21BajBDOXI2a2M1M0pJNW9vMWN6b3NVaURkelJP?=
 =?utf-8?B?Z0V2ZC9lRm9TOXBYbVUzRjNHOU9xNUV3WWxyRDJ0OFhzdi9kdkE3S2lmc0lM?=
 =?utf-8?B?cEp5cE9QUURxNjJxRHJlakNPT3k4Wk9kWFAvSm9TaXByT3FsUUE3RE5jalFY?=
 =?utf-8?B?aXRRWkZ3Y0RNOXNZQ2t2a01Zdk91NUoxWnNwN1RYc2FleG5iMVFtZWNsZElP?=
 =?utf-8?B?NjBud3d3WVdBRjhhdkVlYnpVbTZnNEFKU282aWhIcXdDZkNDdFVDcmpPTko0?=
 =?utf-8?B?UG9aMHJsdlhScXBiYlUyTUVVRGRlQ2kxMkMxdmxuc1RWdzhSakMwT0xzUS9M?=
 =?utf-8?B?NTYrakgrRVduTmhrZ3UyMW5OeVc4Y2ZsTDZvdTNnUUV1MW5tTm5zUXlNby9H?=
 =?utf-8?B?cFp2ZWFvbzlyd2ZaVFVDVStJUDdNelRTc2wrQmR6L2RwUFREbnhZQlBzZkJt?=
 =?utf-8?B?OENPalh2VHpWcmJST0dmbWNCSXhFVTBzR1RqOG0wQUZmUW1Sd0dnd1N1bjFO?=
 =?utf-8?Q?yxOP5QrO8iwLVmhPqwJbFRQ0HILEutCt?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8897.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?MUFTMXIrUHpLMFUxZzhVOXYyYXF6STd2MmJTMks1OS8vQjNIRmsvbDdQUGxi?=
 =?utf-8?B?UGRBdjlrMDBBblFCOElqcERrMDlpblNHZ0g5Mlp3VUJLYmNGK1NDZ3BwYnFj?=
 =?utf-8?B?MjQvckg5cllWMkhJRnBHY01CZVNjWVA5VWp5T3VUbTlPRERGRWdWc1dHNDFm?=
 =?utf-8?B?amJFN3NzRC9UOG93VDVnNnVxWG90Mml4OGVCMnFLdE13eEdDWWg0azJoSks2?=
 =?utf-8?B?L1ZWbFBaczNhdXA1NTE2KzJrUm9VV0c5S0RQZHp1MC9vVlM0M2FaWHY0cHhR?=
 =?utf-8?B?T25JTWxEMWdoVFVVY2t0Z1ljQnd0ZW5tSmRYUU5XYXQyZ2Y4TjZ3S2FqOHRW?=
 =?utf-8?B?Q3NLbE1nTkgwNitGQWR1YVlDZFlzc2puY1NqTnpjT0lVRW5ieWdaVlZTNml2?=
 =?utf-8?B?QVA0UW9FOTVDWHZwTXZyRW15eEtZVHl2NmhKN0xFRk82aHdhOWxyQWZYWlVy?=
 =?utf-8?B?UjRrUjd6S013Y0tQdk5GRGc5U20wd0FxME5tQUEzUzVDZkJTajllRUhjZGNW?=
 =?utf-8?B?SVloNDNFb0NKS0FETkpaWlhCVVVLaTFQYjVzNGdHUUJjM3I2SVNnbW9wWUp5?=
 =?utf-8?B?QmVXbG9aZW00a3NCMnRveit5SlkydWFmNStkdUhiSlJZeVN2Rkd3ZUNFdzh1?=
 =?utf-8?B?S2JxOVE0c3dTK2N1ZmlzYWJxRDlYenJSTjdtNE13Q2NvckxFbmhuZVdCVlNq?=
 =?utf-8?B?M2RCWEdPMngzTXpGa3hGcVo4eFpqemRwbE1kV0U1SnMwTU1xcUJ3NWpTc3VO?=
 =?utf-8?B?SGlMajBWcGpyajQ4VU4xbWlTUHJXM2x3ZWJuWUgyWjJWQ0VvcVlFRWdXNC9U?=
 =?utf-8?B?K0NKQWNxUFpNL3FDaFBkcGhOTXhocStYUFVEU044M08rNjR1Mzg4TGNxWXhh?=
 =?utf-8?B?WWZtS0F0ZW4rdXFpM1ZWeTJ3SGNLamprTFBZM09CWVNRcTh3Ujg4TERBWElN?=
 =?utf-8?B?MmlXaklFR3ZoYXhlcUxGcUhVS0FlcFhhcU9RY2xTWkJpVkxPWXV5OVRGVjVN?=
 =?utf-8?B?VjVFYkRkOW5HWWpKV1RWV0tsNUl2d0RCY0QxUzZ0SytXbGhFZ2VnZ0gra2ZH?=
 =?utf-8?B?ZXFkMFJERUdYM3JnK1U0SUFWYmFRUUJVaGt6aEJyVG84d0JQL3orNDRuOHBt?=
 =?utf-8?B?dmoxUTVHSjZTYTlvcFJEdnZWQXEyQlA3WlFhelhDY0F2ZVlwSmNPVTR2aXFM?=
 =?utf-8?B?NXhJUnRJdzcxMVIrVi8xM2lOUDE2VUZBWWxGQnhGOTQxcDAyWE12S2VMNnQw?=
 =?utf-8?B?MnZRb2NUSC9PbVl5ZlZaYms5bzA4NTlnbTl5amZjd1poQzdqRkwvSE8rWElW?=
 =?utf-8?B?cHpLWllGeDltOUROR29qekpOYTdta0pxenBhT01yQkQ5MGpxZGJCRkRlUysr?=
 =?utf-8?B?Q2tzeGdnM1dmeWJnVmRDZzJyeSt5MWlyazREbVUzSVJBNDNBd3FUbHo4SmlC?=
 =?utf-8?B?VjVUWlkxQ3ZhTFhUdW44WEFWYml3Q2R1QkhWVHp5TmVBekVYNmJyd096NnpI?=
 =?utf-8?B?VnJMa2MyQ0h2QURHQXBlTEZUWG13QzdBU3RvelQ0VHlGMWJRclZWQ2d4bGhm?=
 =?utf-8?B?RVUxTk9WN1dLOXlrRWZqQVFXR2l5ZlJGeDVhNzJxaml2QkhDVk5hWnhUMUxO?=
 =?utf-8?B?Mk5VMUpDN1hrdDNjVzQrNUVzMWlXMHV4Y0lNb1RJa0xNWVNTYlpueEpLa3Fq?=
 =?utf-8?B?RFVldTVOYlFaWk91bDNOZTNQdHRVOW5XUTV3eUhmZ0owcU5jcDhDRzRMYjBs?=
 =?utf-8?B?T1JSOGhiOU9yZCtad3ordWw4RVJ3ZnFqYWFjQ0srcmVPT0s5KzNWZElXcG5T?=
 =?utf-8?B?M1ZmOEhtMThoWFNZSzlNUXgvYngwWE9DU0pIUy9UemtOa1U0YkozWEJmRE9p?=
 =?utf-8?B?TDhEMkp1VTFRNUxzQW9FMGUvYkR3QmMzR2toVTZHb00zZ2ZkNVJIazRNanZ2?=
 =?utf-8?B?d0NzSjR1dEJ0S0RSU3pZRk05VjBFWlV4TmNnYzBYSFNONDY4RlZGOE52Ujdh?=
 =?utf-8?B?SFZMRXZCTTZieW1PV1hnVElRZTF6bDg0RHo1d1pyS3NKa2hmYVBPNDJMVFhJ?=
 =?utf-8?B?NlgwNHlrV0Y4eWRQMDUydjdYckd6VWp5Y1dsV3NJcFJVTEhlMG01SnYvQkVr?=
 =?utf-8?B?QWNmK09DVDFoMTdtU2FmT1d6N25jSzE3VFZQa0pKdDN3S1pGaklER3JrYjJ5?=
 =?utf-8?B?dXc9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: f6e59a65-a18b-4adf-67e8-08de0fe97800
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Oct 2025 15:00:55.0049
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Jsl7rUG2T3GYpfmEy9F/Qy8LHM3Wu1VtYuiq/FSCa2okSucvGz1mbIjWMcvmXn7clMr8awyX8pMgNyWQG5HVrJR10rT+9/lrkU3EAw33mbY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB8047
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 20 Oct 2025 15:01:07 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7760

Hi Antonin,

On 10/14/25 11:38 AM, Antonin Godard via lists.yoctoproject.org wrote:
> Improve the documentation of the uboot-config class. It was not
> explaining any of its entry in UBOOT_CONFIG. Mention that using
> UBOOT_CONFIG and UBOOT_MACHINE at the same time is not possible.
> 
> Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
> ---
>   documentation/ref-manual/classes.rst | 42 +++++++++++++++++++++++++++++++++---
>   1 file changed, 39 insertions(+), 3 deletions(-)
> 
> diff --git a/documentation/ref-manual/classes.rst b/documentation/ref-manual/classes.rst
> index 662121ed9..f1fe48648 100644
> --- a/documentation/ref-manual/classes.rst
> +++ b/documentation/ref-manual/classes.rst
> @@ -3170,15 +3170,51 @@ variable using the "type" varflag. Here is an example::
>   ================
>   
>   The :ref:`ref-classes-uboot-config` class provides support for U-Boot configuration for
> -a machine. Specify the machine in your recipe as follows::
> +a machine. Specify the machine in your recipe with configuration entries::
>   
> -   UBOOT_CONFIG ??= <default>
> +   UBOOT_CONFIG ??= "foo bar"

Why would I want two configs?

EDIT: I see this is explained in the glossary, but I believe maybe we 
should duplicate the explanation (or at least point one section to the 
other).

>      UBOOT_CONFIG[foo] = "config,images,binary"
> +   UBOOT_CONFIG[bar] = "config2,images2,binary2"
>   
> -You can also specify the machine using this method::
> +The above options correspond to:
> +
> +-  ``config``: the defconfig file selected for the build of this entry. These

Maybe reword like this:

"""
where:

-  ``config`` represents the defconfig...
"""

Otherwise the wording today doesn't really work.

Please define what "entry" is, I believe this will eventually be 
answered at the same time as my first question :)

Can there be config fragments passed in there as well? (e.g. any file 
ending with .config is a convention in U-Boot for fragments) If that's 
the case, it's... a bit more involved than "anything in configs/ works" 
as fragments can come from board/ directories too. Haven't looked what 
the logic is though.

> +   files are found in the source tree's ``configs`` folder.
> +
> +   *This option is mandatory.*
> +
> +-  ``images``: the image types to append to the :term:`IMAGE_FSTYPES` variable
> +   for image generation.
> +
> +   .. note::
> +
> +      Appending the value of :term:`IMAGE_FSTYPES` is possible because the logic
> +      of this class is called from an Anonymous Python function.
> +

Is this a detail we need to provide?

The provided example in the glossary doesn't explain what that would be 
useful for.

EDIT: looked up who added support for that and the author had a 
freescale address. The commit log does give a small hint at what that 
would be useful for (generating a ubifs for u-boot supporting NAND). 
Then I went on to clone meta-freescale and it's used mainly in SoC conf 
files, where "sdcard" or "ubifs" is put there.

I'm surprised this was allowed as typically the mechanism used to 
communicate between recipes is not through variables (variable context 
and all) but through do_deploy. If that really isn't frowned upon, I 
think this could help me in figuring out a way to properly generate an 
extlinux (generated as part of the u-boot recipe) based on 
KERNEL_DEVICETREE set in a kernel recipe (I currently have to set it 
from the machine conf file, but one can typically build a few different 
kernel versions which have different device trees so one needs to update 
the machine conf to not only change the preferred version but also the 
kernel DTB(O) to use/include).

> +   This option is not mandatory.
> +
> +-  ``binary``: the binary to select as the main binary for this configuration
> +   entry. When U-boot compiles, it sometimes outputs more than one binary as a

s/U-boot/U-Boot/

> +   result, for example::

I would suggest rewording to:

The output of a U-Boot build may be more than one binary, e.g.::

I find "When U-Boot compiles" odd, couldn't explain why.

> +
> +      u-boot.bin
> +      u-boot-with-spl.bin
> +
> +   Setting the ``binary`` value to ``u-boot-with-spl.bin`` will make this binary
> +   the one selected for this entry.
> +

And then? What does Yocto make from this "binary"? What I could find is 
that it's then used in UBOOT_BINARIES variable, which is used when 
generating a fitimage (c.f.  meta/classes-recipe/uboot-sign.bbclass) or 
renaming them in meta/recipes-bsp/u-boot/u-boot.inc. This also seems to 
highlight you can have multiple values in there.

> +   This option is not mandatory, but the value of :term:`UBOOT_BINARY` is used
> +   instead and should be set.
> +

Would suggest rewording to:

This option defaults to :term:`UBOOT_BINARY` if unset.

> +You can also specify the defconfig used during the build using this method::
>   
>      UBOOT_MACHINE = "config"
>   
> +In this case, the value of :term:`UBOOT_BINARY` should also bet set.
> +
> +Using :term:`UBOOT_MACHINE` and :term:`UBOOT_CONFIG` at the same time is not
> +possible.
> +

Mmmm... I would recommend restructuring the class documentation here. 
 From what I understood, there are two ways to configure a build, either 
via UBOOT_CONFIG or via UBOOT_MACHINE+UBOOT_BINARY.

So I would write something like

"""
The :ref:`ref-classes-uboot-config` class provides support configuring 
U-Boot for a machine.

There are two ways to configure the recipe for your machine:

-  Using :term:`UBOOT_CONFIG` variable. For example::

-  Or, using :term:`UBOOT_MACHINE` variable (and its companion variable 
:term:`UBOOT_BINARY`). For example::
"""

What do you think?

Cheers,
Quentin

