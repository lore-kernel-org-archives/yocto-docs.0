Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0984C28B20
	for <webhook@archiver.kernel.org>; Fri, 28 Mar 2025 13:22:06 +0000 (UTC)
Received: from EUR03-AM7-obe.outbound.protection.outlook.com (EUR03-AM7-obe.outbound.protection.outlook.com [40.107.105.71])
 by mx.groups.io with SMTP id smtpd.web11.10973.1743168124470739158
 for <docs@lists.yoctoproject.org>;
 Fri, 28 Mar 2025 06:22:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=IS81LQOL;
 spf=pass (domain: cherry.de, ip: 40.107.105.71, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kq50DNNJf55Qj3AKXDIIWuY6p4GpEKd8/CxHWGMeeL0s4anRO98cmblum79G5b6NcU6BuSWjFPfCdd2abIiE5+VMDpg+9fUDHvKhKkE58DDTTLTkfdE8l8zICgXM/97j4iT6pDks0RO8OszlMoWjoEvnY42qKB7TcfYPLGyBm82qi3tAM07JJJB2Yg/uIcgi6lY/PTOymu6HhEZyS2rdTrntekFe3Q1DFLt2CwcDB/NheRoeDudSkvCNzwoXKRUpANPL8hjQ3/c1MgtdjEiE4b8dQ55eZh8XHVfLeTLyUcXZT/fRYTU8dOzABoHs4dzLnDafy4DebjNpuYU74R7W2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=29pncHSh7UN/y2WhG33IeuyjXuZIMalBBG6nyuillOY=;
 b=zSZeNOu+DEYq6626ZtQXI45RVfVJTlstTti0oIbTSHMz+60AEVrhTn9tXQoakOMn3JfEpBBgvOq1X9uyttATr1QXMbCMRSXgtYZMecXR91FsXNnq6H5STf5zgmdN3HeC1XimbTtci8eGuJBnJltrFq4Uu2ZaEHePwO9k9QkdGBCk3jEnY2NMZ/xDBMSdJ7nrkpKGaRHcdhekroXt7RQZLqUyRgLPRWKruIdN+xCDQAPlp1q6EeU8kyiRqS5zhFxG1AkoVFdymCa3btDHas9QXScI0TMQghA5We0lxP8qEmevo3ccRHRXWAn1/0hSwmRZMAjhTAh6C5b4PvtsgO24kQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=29pncHSh7UN/y2WhG33IeuyjXuZIMalBBG6nyuillOY=;
 b=IS81LQOLKpnvkgSEg4Oe3CeHNftwAqeF9pxpPWcSP0DiACXqUHFQoE4no9qvZV6pNlsDDUHCW8v50x0eXzdYHm6uGlh3jtlaud460NwM+PBWE5ay+wIukyJVtQ+57isBLmtIHcObLnyIBlagBkxvm3qr0Be/apmIc8KFaUMyzRU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by DB9PR04MB8361.eurprd04.prod.outlook.com (2603:10a6:10:24d::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Fri, 28 Mar
 2025 13:21:59 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a%6]) with mapi id 15.20.8534.043; Fri, 28 Mar 2025
 13:21:59 +0000
Message-ID: <4b0ed17f-5d47-48b8-80a7-55e88369459b@cherry.de>
Date: Fri, 28 Mar 2025 14:21:58 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH v3 1/6] documentation/conf.py: define a manpage url
To: antonin.godard@bootlin.com, docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20250327-cc-vars-v3-0-742dbddce008@bootlin.com>
 <20250327-cc-vars-v3-1-742dbddce008@bootlin.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20250327-cc-vars-v3-1-742dbddce008@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: FR4P281CA0342.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ea::20) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|DB9PR04MB8361:EE_
X-MS-Office365-Filtering-Correlation-Id: 2690d8ef-4ce5-477a-adb7-08dd6dfb84d4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|376014|13003099007|7053199007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?ZUdjTHRaZDFjQk01Q1RyT05rbytMNmpWb1BOaXd2QldwWUx3b1ltNGtwRDU2?=
 =?utf-8?B?RXRoMFgrOTJ1VFl6cXkvVkZNYzE3MzUxQjZzQnQrakRJczFTaStVK25GZHNk?=
 =?utf-8?B?bjJya0lHa3Faa3NJTE5zQXNaT0NkUmxDblZpZW1IaVBOS05EaXFWbGl2LzlN?=
 =?utf-8?B?aVFpd1JqcWVPVEhseXRudlAxRGxLenB5clA3WEFXaitVMU5YcnBHQkVRbjVR?=
 =?utf-8?B?ZnBwOUY3ZlV2YUMwazZQZENuSGM4VE5rNjkzOXdKeTNzaWFKTGM1WkVJNlR2?=
 =?utf-8?B?UnVjMncwTmN1NG0zVDRwM2p2TndycFV4VEtkVUk0VkJsMzdWQklOb0Q3RDc5?=
 =?utf-8?B?Tzd0QlZNekJlTVhFN3R3TnF5T3BRSkhMKzVQZ1JLNXM5ZmFxa0g5d2VxN3Zw?=
 =?utf-8?B?YlFCa1pBZkVuY3puUXErbXJqYmZJVVZoNi8rRmNpaktDM2ljMWhIcUZidy90?=
 =?utf-8?B?MzUzWXdXcS8yakVOV3FZWS9LeUlhQXd6bXB2YkJHRnEzY0JrbkdSNjdLMUJ5?=
 =?utf-8?B?RTlhRklFWUw4MVNqNEhMS1VTMXVCNENQS0xCdUgzZXhYaGxSdmRLMFNNN2tq?=
 =?utf-8?B?OTBwTFlPOEpHYTFCajArUkdrdWVWUzRjMXFMKzhkRVE2S1JMUmNBVnNjMzJZ?=
 =?utf-8?B?bkJPbk0rSFo5bGZUUUhBcFRWQzlWeXFPOS90K0RaK0VzWkJONkpyUjNnbitT?=
 =?utf-8?B?RVkrdTRqYXBXNk1zM2YxOTBFYWdsTnJHZkEwUmErWTRRT2xGeDZvUld6TFlQ?=
 =?utf-8?B?RlBneXJ5Ti85L0Q3TzJyRkVWQWpHbTRvRlM5QURWZ3N4OUNPQXVDemZyak1T?=
 =?utf-8?B?UFF6S3pKdmJJLytkME1Rc1ZBR3RONmJIdkd6RlR4bTFRNzJUL1pSaUVFS1pz?=
 =?utf-8?B?MUt5dHhDTkZZeTlZTE1xZHo2SStnSS9HbGxKNE9nYlRQMjYwM09kbUQxTUJN?=
 =?utf-8?B?K2lDTXNUQjZOVWplZkUwUHBlbEdCTDFFb0ZlK2p0YWlTVUNjUGhHdHN1VC9R?=
 =?utf-8?B?WHFKOG02R1RKUWVoM0dFUVRkVG1OME9vY0syY2dJaG53bFdENHBYMW9WMVlI?=
 =?utf-8?B?cEhTQy8rTk00S2xXUGJYS0Y2bk5uY1JWVld3VE1nQ2hkcHJwcEkwbHNKWU1a?=
 =?utf-8?B?N3Fha1NqSGY5dWZhdFlObWNYd3JyVHpuSGZEZ01zV1krdXhvclFUd2M5ZU1s?=
 =?utf-8?B?LzJ0M0tWRzNLRG14d1VCR2R2MUxpeVU1SlJjUVc0TURSK3dGS1VIdzlGRDZ2?=
 =?utf-8?B?Q1l5a2pXT1doMUhPOXM0c2h5UGtRcEc4Wk44RWhkNjY2MTJ5ZWhuM0pQL3Rv?=
 =?utf-8?B?c0Ywamcremx0SFdSTTdPSXUrVEFyM3RHUk4zZUJTNkdON01pWm1BZ2QyL1g2?=
 =?utf-8?B?d3ZIeEs0WTAwV3dCelVyb053cDdRLzNGeFg0VUpOZWZnTWJPQkI1UVBZUzNR?=
 =?utf-8?B?QW90Njk0cHFhYXVuQkRxa29kV2NaRzdFM1dNMkRiTWlNTTRiYlVWNkMyL04v?=
 =?utf-8?B?UWF5WERlOUYrVEwwQ0RVK0t6VFY2Wk1SVy91c3plLzhrNUlvSmxTdktHcVJQ?=
 =?utf-8?B?QmN2VnhMNmlwdlpMZ3hCaDRqZVU4RHQ0allaYmowK0plWS9vNDJOOVNBbHlX?=
 =?utf-8?B?YmVEQWZzb1V6UFIvZXNUWFRKeHQ3MllQay82M3BVejhnV0JKWkJGL3N3bzIw?=
 =?utf-8?B?dExUZUJCSmlUSEZxYmVwYTJkVzAwcFd4VXVlb2JPM2I5VER3QVBlTnNxNUhS?=
 =?utf-8?B?Z0hTd3RiOVExdnlFRklmT1o5bElGVStvOFBxNUVGakZQU2o4T2VGUW1jdHpE?=
 =?utf-8?B?NlpxNTR5NVBiNnRvblBhUT09?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8897.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(13003099007)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?VTZ0VkFVYTNFV01IZGFIeGUzeWcrbmZ2ajhPWk5wZThabVhidFI1RFMzUUdO?=
 =?utf-8?B?S3pXY3VCTmVoUk9FQjY2L0l0UTg1RmpDZUxpVS9GdTJPN0V1M3NKMjR0Mmd5?=
 =?utf-8?B?MzAxMzVMUENQaU4zWXdvYkgzL0tSaHZzQWRPMEZTRWhzOUF2TmxFOUVITzFq?=
 =?utf-8?B?L2xLTmRReXVFT1hMd0diYXVnNVhVcm5tTEF2NzZ5dklJeTErS25ZTEkyVXlh?=
 =?utf-8?B?LzJQZkVFdTdyVm8zcHozMkhudi85REg5eE9MTzJiMDZqNHdYWjdTWXhrc1c2?=
 =?utf-8?B?Q1lhdGRvNDZSc3drYTJXbEVBVStJNFJ1TWpWdFRGYjdrWk9HM1FzdFBxelRp?=
 =?utf-8?B?RTE5WHhUTGZzZ3R3cWFqeDNTeGFpdVF3SkEwUmNtZEZWT3prcEdQRHFDUUtZ?=
 =?utf-8?B?aDExWGx0Uzd3c0FKbHRnZzJ0Sk13TllrWWRwcGNNaEljTTg2Z1lJeFVVYU5h?=
 =?utf-8?B?bnMyeHNoT1FEbTlvWVZNdjZBMjhGamk5cWRtOSt1YUlpMWxKRmhzZTlPNUhr?=
 =?utf-8?B?YkhrazRSSnJFL2tMY2xNMzFaWUZBcFFBcFlVcjFnNFhYbFc4WnVTNDQveVJn?=
 =?utf-8?B?azYyaUo1ZU90QmZWM2hDMzhNK3hWbldVUWFoTk1GY2dXMTdEdHB0Ulk2ZXFz?=
 =?utf-8?B?bU5KLyt2dEF4bi9zOEtoUjl5MEpmaHRtcnhpMDhJczVSV3l0V1NIVEx6UG5z?=
 =?utf-8?B?dFRMSXZYd2Zra2hyY0NZVjR5MU5GdHBTTFpTU2ZNSzJ0MFh5ekFhbGtzM1M1?=
 =?utf-8?B?RGxjeXQxaEV6RW9tcW1uYmROQmMvTWdWblNmeGNzWi84MmFIbEhRWDhlT0lD?=
 =?utf-8?B?YlBNeTdqdmYzN21jc1hzN25YNy9uNHMza3pJb0xnb0lldnZDdUhPMFZ2Y2dH?=
 =?utf-8?B?NDMwb2NrZmZkQXFOTTNsSStmMmN5NWpJSTZidUE3bi9VVjBrVFpJNGcvMEVu?=
 =?utf-8?B?ZEwvSXpiT3ZnVVR4ajE5cGFOMUc3WjBzMzRjMFh0VG1WU2ZweVFuWldOUkJk?=
 =?utf-8?B?NFBIWEJPSFYxSjdyWHBWc1Fockh4ZFgrSWE0ZXpreWtod3NOWWcvSDcyeXo2?=
 =?utf-8?B?UEdqRmZDN3QvK3h5ay9HVk5TdTk5SGJXa2RLcXhqSWxJcER6VWpxTmxOVVVp?=
 =?utf-8?B?cXdRZ0VqK21oRlNzaXArWmZxV3ZRNFJKTkNsNllWVnRBWnhyQ0tzYlRmUEZa?=
 =?utf-8?B?K1RPTDE2bnVzNUUzTTNnU290MGtSdGYrS05PY0xmdnA4a29qMCtrbm9DVlF0?=
 =?utf-8?B?elBabTZTYTQyUFRnYmczRHNiQmkwSWNDamJGOEQ1TmcxcE5rSTVyRzFka3R4?=
 =?utf-8?B?a3BiMUVVKzFYZUdIZlZxWDc1Z2VnSDVNd2pabERjYVBWMVlrREw1NFN4djZZ?=
 =?utf-8?B?Y0Nka2JrUU1jUlhJZDFXSExBbVJTMlMwcGt0YzVGZ1dwanZiNlVYbVppUjJy?=
 =?utf-8?B?eU1OajBUeXhyMG1QQmNIRmY0WkVYaHhwNWl2RC9RUFdlR3pPdFU1dWliWm1C?=
 =?utf-8?B?aE0wK0s5ZGtyd01oR243cXBQdU9ya2ZGenI5TDFKbEQ4Z0ZrNEdlWEdPaExn?=
 =?utf-8?B?azh4NVJ3Si9oSkVzdUR3dXpmT0duNDJHMm1qZThacStUYlBXd1FkMjRaQWFF?=
 =?utf-8?B?SzRBR2ZTdlRVaktCRm9VekE4MjVFTk5wcUhVVmZnTDd4dnM2bGcwSGJQdWdw?=
 =?utf-8?B?UEFaSENmNm1hVkJmV1BQYWJPTmZQREgvQXdtTlN3MUQzSlJHZE9udkp3MDM0?=
 =?utf-8?B?bVlzVHZCdnZLL0o4ZURXeHlMb0VmTTZaazhDWkpKRlp1dVFQb2taNmoycnpj?=
 =?utf-8?B?QXNxdktHVUpuK1hndUlUNW1qR3RHaHk2WDU3UTV4VkFIektvcmZxdWNxSDho?=
 =?utf-8?B?UlkzZFRCZzdnc0ZEelZ6UmFlQnJKd1JEeU5qYWxZdnhZNXdrWk9ORVg1ME1y?=
 =?utf-8?B?dHhiRlE0dlhiNnhvWkpiYVhISEU3YXhidUh4VGxPb3pjSUhyWitEOXI5MlI5?=
 =?utf-8?B?WmViSjNBbVR2Z1BMUFRPeVJnT0dkTE92UmV3bFRhVGJLT3NiQ0ZDano5cWhX?=
 =?utf-8?B?TmxUdjZWN3ozNlhBdVdGWUxtUGpqaGtqaVd2Y1VmSUg3U20yUUVOR05jWVY0?=
 =?utf-8?B?TkcyRGJmcXJVc1ZOeFVkSDV2VmIwblVCbkVsWExnaWllREFnNmZVS3lBc3Jt?=
 =?utf-8?B?OGc9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 2690d8ef-4ce5-477a-adb7-08dd6dfb84d4
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Mar 2025 13:21:59.0830
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2EBupJ2zakYJpWmSLop3rWXVZkwEBDu0jB4L3rVHFSAQ1+aOIZ3PK6S2gMNwkcrxPIQbo54sFcwozxmC989xlRsO6iCJBCql6BLnpw5Qn44=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8361
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 28 Mar 2025 13:22:06 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6667

Hi Antonin,

On 3/27/25 10:07 AM, Antonin Godard via lists.yoctoproject.org wrote:
> By defining the manpages_url we can use the :manpage: role in the
> documentation for providing links to manpages. See:
> https://www.sphinx-doc.org/en/master/usage/configuration.html#confval-manpages_url
> 
> Replace existing manpages links to use this role.
> 
> Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
> ---
>   documentation/conf.py                      | 3 +++
>   documentation/overview-manual/concepts.rst | 2 +-
>   documentation/overview-manual/yp-intro.rst | 2 +-
>   documentation/ref-manual/variables.rst     | 4 ++--
>   4 files changed, 7 insertions(+), 4 deletions(-)
> 
> diff --git a/documentation/conf.py b/documentation/conf.py
> index 477e75112a..0352bbef20 100644
> --- a/documentation/conf.py
> +++ b/documentation/conf.py
> @@ -111,6 +111,9 @@ extlinks = {
>       'wikipedia': ('https://en.wikipedia.org/wiki/%25s', None),
>   }
>   
> +# To able to use :manpage:`<something>` in the docs.

s/To able/To be able/

> +manpages_url = 'https://manpages.debian.org/{path}'
> +
>   # Intersphinx config to use cross reference with BitBake user manual
>   intersphinx_mapping = {
>       'bitbake': ('https://docs.yoctoproject.org/bitbake/' + bitbake_version, None)
> diff --git a/documentation/overview-manual/concepts.rst b/documentation/overview-manual/concepts.rst
> index e4d806f98f..416c28f0d9 100644
> --- a/documentation/overview-manual/concepts.rst
> +++ b/documentation/overview-manual/concepts.rst
> @@ -2204,7 +2204,7 @@ require root privileges, the fact that some earlier steps ran in a fake
>   root environment does not cause problems.
>   
>   The capability to run tasks in a fake root environment is known as
> -"`fakeroot <http://man.he.net/man1/fakeroot>`__", which is derived from
> +":manpage:`fakeroot <fakeroot(1)>`", which is derived from
>   the BitBake keyword/variable flag that requests a fake root environment
>   for a task.
>   
> diff --git a/documentation/overview-manual/yp-intro.rst b/documentation/overview-manual/yp-intro.rst
> index 4a27e12e01..11e6d99e32 100644
> --- a/documentation/overview-manual/yp-intro.rst
> +++ b/documentation/overview-manual/yp-intro.rst
> @@ -400,7 +400,7 @@ Yocto Project:
>      Autobuilder :doc:`here </test-manual/understand-autobuilder>`.
>   
>   -  *Pseudo:* Pseudo is the Yocto Project implementation of
> -   `fakeroot <http://man.he.net/man1/fakeroot>`__, which is used to run
> +   :manpage:`fakeroot <fakeroot(1)>`, which is used to run
>      commands in an environment that seemingly has root privileges.
>   
>      During a build, it can be necessary to perform operations that
> diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
> index 41bda5d0d6..4e675b6bfb 100644
> --- a/documentation/ref-manual/variables.rst
> +++ b/documentation/ref-manual/variables.rst
> @@ -4514,8 +4514,8 @@ system and gives an overview of their function and contents.
>   
>         The value in :term:`INITSCRIPT_PARAMS` is passed through to the
>         ``update-rc.d`` command. For more information on valid parameters,
> -      please see the ``update-rc.d`` manual page at
> -      https://manpages.debian.org/buster/init-system-helpers/update-rc.d.8.en.html
> +      please see the ``update-rc.d`` manual page at :manpage:`update-rc.d
> +      <update-rc.d(8)>`.
>   

This will render oddly no? I haven't compiled it but I assume something like

"""
please see the update-rc.d manual page at update-rc.d.
"""
?

If that's the case, maybe simply have:

:manpage:`the update-rc.d manual page<update-rc.d(8)>`.

? What do you think?

Please consider having a separate patch (not necessarily in this series) 
addressing Mark's feedback on fakeroot.

Looks good to me otherwise, with some change for the update-rc.d paragraph:

Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>

Thanks!
Quentin

