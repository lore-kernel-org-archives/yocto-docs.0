Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66047C02183
	for <webhook@archiver.kernel.org>; Tue, 14 Jan 2025 10:28:14 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (EUR05-DB8-obe.outbound.protection.outlook.com [40.107.20.82])
 by mx.groups.io with SMTP id smtpd.web10.41303.1736850485819275021
 for <docs@lists.yoctoproject.org>;
 Tue, 14 Jan 2025 02:28:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=mLAx9R9k;
 spf=pass (domain: cherry.de, ip: 40.107.20.82, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PC06tXIZur4/T1r6MgBq7JKVPzoDmARdcI+H+5SaLpGvVrxdJ3EY7KjbrGh6ESLdWw6j8jA/LWWlqYangxUyWHuSIrtroWHILE0gnxYMc0qOtndXEriQFiaLGycX1ova4PEbSeLk1e92LjDG8+ATAeBc7EcCaXPrc/NhvuG/ALRB47MoT2Jq+PJT5N6ch/d/ED826I4o8Kn9woga/CLUpCZ8qeiyvytLrkkAK0qK0N1cslkMYebjROMy4YTGMIzRukbz31d0J6R9OrYZgIwg/mlzr59pTxTffKroWtveIHFoo5UZtXnkuP354rWEenY+NktPVFLbwKlgjvhb0uR5aQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0SgImrs1cSI4ar6q/zGIAAfoF7v/djPS0SAkHmGxkhM=;
 b=OJC5vmr3mm5uS/gkHz6ivIFTlyuErePww4H86Y/ODRguEm1UzVc3nemis8UK0tdS+1FEDBJ3yDJ1e+qx5LywJhDeB+EGkGm2YpHWqxtlpzL9JHTW3AHRq8qbXagzNpgc2P8nX3JwdMMBFRvWvMcqj8l5hFeFVvVdLR/6zKi1EdeM5dsb4eUJ+FtSxeQtx16fy5tyrVRGtVaLgbgqqdHlfPLO6n0ev5YIS4qZjnr3LwrNBILrLkVL7oQL6bDDZrzWKUOs9p+p8Cyf/yEi3P4cPyUmbkV+6OpHBfGXXfUnL2eXWpeHQuyoakgjHAkxm1wzwbAJOACB+h77dv/E4NKZoQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0SgImrs1cSI4ar6q/zGIAAfoF7v/djPS0SAkHmGxkhM=;
 b=mLAx9R9kv0C2GitbPbWT6nsKNMMVl5/RpopVnatPnHt+XNR+Efs/GEN3i3/BFg7PkHYRpOcrz+RXt7KACKrmQgAYmBqylFRONOFNp8Bs7WnPLjGSIE2Wi6pqgfl0C6GvXIennBU7tPxQxjO0WNks6kCF32dnhQ4KIWnWW7TJ0M8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by DBBPR04MB7993.eurprd04.prod.outlook.com (2603:10a6:10:1eb::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.18; Tue, 14 Jan
 2025 10:28:02 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a%3]) with mapi id 15.20.8335.015; Tue, 14 Jan 2025
 10:28:02 +0000
Message-ID: <13a1b860-223b-4d68-9937-bafa2ae71784@cherry.de>
Date: Tue, 14 Jan 2025 11:28:01 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [yocto-docs PATCH v2 01/14] ref-manual/variables: document the
 KERNEL_CONSOLE variable
To: Antonin Godard <antonin.godard@bootlin.com>, docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20241220-release-note-5-2-updates-v2-0-df29527f3fc5@bootlin.com>
 <20241220-release-note-5-2-updates-v2-1-df29527f3fc5@bootlin.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20241220-release-note-5-2-updates-v2-1-df29527f3fc5@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0191.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ab::14) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|DBBPR04MB7993:EE_
X-MS-Office365-Filtering-Correlation-Id: 4e14714e-1e14-45ac-1d99-08dd34861fdf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7053199007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?TFdrME51KytBRDNJVTBEaXRIKzNBQllPNkNBbFplZHZFQjhjaXRManYwd2lQ?=
 =?utf-8?B?bDh2TG1SZHN5T1hPcnQ2N3cwVFp2SFR1MWkyZjRhYWtYY20zUzJEOGljOHFW?=
 =?utf-8?B?OHhqdmZSSDd0clJqSGJXRCtJSHpDZHREMjdYNHQ1N0hSSmx0N0Q4VnRIMk0r?=
 =?utf-8?B?OWJadmQzaHFRdlYyRDByR0RpVVkreXMvWW5VOGIxK2ZJRWNtVEpyUUZXbmF5?=
 =?utf-8?B?VlpKdjFtVUwyL21YdzFVNll3aXA3ZmQ5eDNvV2F0WS8yVmdDUUNaa3dKUzlB?=
 =?utf-8?B?RGFHOU5sQ09OcW90SUVEWmxGY2tDMFFpTEpiU1N3T1l4cHB4RFhNamRtVlNB?=
 =?utf-8?B?bnNibm1ZZ2UvUW11c0xPaDd1U1hNTWJPOXpMb3FsSGJ1ZFhlWEpaT2pmTEpM?=
 =?utf-8?B?T0YvT0JnMkdiWjBhVmJrY1phNjFWYTZGTkgzcEh6VjB1QVVGbEZoalFQemFX?=
 =?utf-8?B?NElvUGJaSHg0c0MzOHJzNDVjZE4va1BXR1lucVNMbWZIVWRFdk1XbklRaTZm?=
 =?utf-8?B?TVdYRC8vd1psSkMzcHlrejZEeURLNDlqSitUMVppRVlsZ01hcW50eTBscUVm?=
 =?utf-8?B?eUYwYVF2Vy8wT3IrdlRMMGRmQWhBOU95UzhDVmxSTWRRYVc4Q3NhaTk4am5y?=
 =?utf-8?B?eVN0VEhoUGJCM25lcXdhZmFNMk9xY1FjazNLbzd6RTJERnFZdk5DdmNPdWxT?=
 =?utf-8?B?M1JFcEYxY3JncXJ3NlI0c2pYMWl1bXBjOG5pcCs1ak9FbWtBVU1MSmk3eDZH?=
 =?utf-8?B?RlIvYVJhYkFVWlNqbGRIZVJNZlV4V0xHTDVIVjJVSVpvbTd5NGtUWE5tMjFi?=
 =?utf-8?B?V2FzU0VvVHFpSWNrV1RrcHNTRTFRbW9Qc2R6NTlhRnU4bTZDQStzTjlTNUU4?=
 =?utf-8?B?TUlUejVCSDFzL3J3VDdjZllDSVVvalVPclRWb3MvTFIvdmVHU0RqSit6bHFC?=
 =?utf-8?B?MkcrdHgyUnZlVUQwQllBeUpiZmExNjNBNWNaOUxPdXFKV2RWSDkyMmI4bkw1?=
 =?utf-8?B?OGZvck4xVTlCWi9UanpMTCtMYVdxQXR2ODlaby9neDlGUWVrUlBOdHVjZmFB?=
 =?utf-8?B?QjZ4cDBMcDIvbkd6d0srckJtSGFEUmFmRDRzYS81YTlmalBzME5JNDVIVm9Z?=
 =?utf-8?B?a0Z2c3FsWDFXNlEyTWRJZWYySHBwMkZOSGZTK091Q0NIaGtTQTNpWDlCR3BE?=
 =?utf-8?B?UFlVWWJIVUsveDZaTWhYa0s2VjBtNnJRclhmWGpNNlkxQnozSHR4TjVPSnBp?=
 =?utf-8?B?aUdiQkxBK2lTOTlhUUZOSEJkL0RoS3h3dXhReTRBYUZlVm5kYjlFaktHTlF4?=
 =?utf-8?B?dkRabWR6SU5ackFkc0xYcFlLKzhiNEtPaFpIcDZyZmlXNFdabUI3dEZoTWZO?=
 =?utf-8?B?enhraHZKKzBhWUFlRnBiakZXSkVibmlIQ204L3R0NHJhOEtJSWZWY0h4Nlp4?=
 =?utf-8?B?NEkvY2NUTkNtRnhLQWx4N25hbUNWMFFBcHRlRHVJcUJqZmxYZDBWSm1ycXo2?=
 =?utf-8?B?aDM3b1E5b3RLVU9JcGhvS0M2N3IyQ1lBT2lJcld0ZlloeTU4R2ptLzd2cjNN?=
 =?utf-8?B?dm5aQi8raVpyOEgwRytpQWJDMUdpRXh6dGdvY2hhR2lvSlFGdHkxWExRdkxx?=
 =?utf-8?B?d2FWWVVPT091UjdJZ2dnVzNOdEUyR2JJUmVYRVNHdXVMSDZrNE1oZWhXdkZU?=
 =?utf-8?B?ZVJMS1hTN2ZDUSs3VTFHakNFckFQTHBZcURydlZEYWoxdkhSai9QeGxmc2d6?=
 =?utf-8?B?SzNMRjhaR0NtcW5zMnhKQTk3ZTI4K3lBKzVRQnBxK1V3aWlKNWNCcmRsVkdx?=
 =?utf-8?B?R2c4NkhkQkZvUmd2UkRpZjdxYzV3bWVSblRhdDIxaytRam53L3Z1eFIyYm0r?=
 =?utf-8?Q?EYVGPFGWbXC5E?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8897.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?Uy9OZEZJaGs4Y0ZjanNXZmttZTdldlZRTmpBZGRlMXFxT1Q4WGRSUEptSWNL?=
 =?utf-8?B?ZUptK001dDV4cTNidGRyYk1sQ3Uvb3V6YWZlb2ZCSWZwOUEyaWxtVUN1WVJu?=
 =?utf-8?B?NEZHS01pazM5ZWU3Y2xtK2ZQSE5Fa2xva3AzZ3g5T0liRmNsbnRUc0xXR0lB?=
 =?utf-8?B?UEtXdFlTQ0Z2Q0pTSXd4NDQ1eGxpNHA4bnZ0YzJjMXU2aEhnbmRFQjhJTVho?=
 =?utf-8?B?OUs0RVNvSjk3djVuVkN0QzlLVDY2bkRHZ3ZMR2thVnNqTlF1cFBINXpLZnVY?=
 =?utf-8?B?U0Ewd0lRclFsOHpkNVFnUVBKQlJKM05FMkpKRVRXQ0hmUEt1dUdVa1NNR2M4?=
 =?utf-8?B?UTAvQ0pSMkdMNytqRVN6cGEreXhJc3BUREVVVEtvOE1qMXZtVUhDQU9wOW1t?=
 =?utf-8?B?ckdtUmx3aU1Ka1ZjZTBUZWY1WEYwTy9jVFFtdEh3YWh1SWcwQXFyWFJLa3Y5?=
 =?utf-8?B?MkNGVnVrc0hlVUNoOGdWdEpKS3RNUUFSQ1JjSncyNWlZQ29VWlRrZzZPcGRL?=
 =?utf-8?B?cVVvWCt5dk4wT3ErTVpjUUdXZXNtWGJIbWQ5anFmVC96UGZ3WUtab0FZL2dJ?=
 =?utf-8?B?cHFFYVlYTnA5bWdYMXRvMy9nS05jS3RSTDJ4aENOV21GTFl6aTkrd1NkY3Fi?=
 =?utf-8?B?WDl1NHVDVnJBYnVmalM0TnNNaUxOUFFYTFUybGVzVUZhMk1NNHJiMHF6d3c0?=
 =?utf-8?B?NkF5NVBHQlpOQytBSVlVV041S0RXb3c5dzZ0emRyTGJpMXNadlQ5M3k2RTc2?=
 =?utf-8?B?TVN3eVA4dEpOc0oweW1RVzZSek5oS0hyL0JSS0ZHTTR3U1U4ZzB6bGhoYVRS?=
 =?utf-8?B?VGhFZG9USW1vRktoUFovRG02NHM0bStrcC9MM3JpWVVScm9KQ0lkRUtiQzBM?=
 =?utf-8?B?WGttUFdwdVY1dmtQNEZzdmxTRGVVWXhEb3FiU09XRTVRTmJkeG9WS3JhYUlj?=
 =?utf-8?B?UzhMaHN6WHJsNjhseklLSVdLVXRMYWlLc3ZmVFpUYldIR0plYS9wckF6bHNU?=
 =?utf-8?B?c3BZRHNlVHBUL2M2WWFvUzFDOVN0T0dCWVF5akkxWUh3TURZU3FCVFlRcDdY?=
 =?utf-8?B?cndjVlg4YXUvZFNzVTN5WWxreVZiaDBlVFRGMHlVTmc0QUJDOEpkSkhFcm1G?=
 =?utf-8?B?eWRzYkp6L25SRTlBL0ZCNzMwV2kzVjRiMFhtKzMwZkhaMmVRVmw5WUxlendm?=
 =?utf-8?B?VHdMcU1vL2NXOFhCb3BialNiaUNnRGdjUEVKeWtkMjFNYWFPSXZkdlNQNkhS?=
 =?utf-8?B?eG1SZ0hYRExNYk96L1NpWjJGdENSbkYvdHR5OFlxUnhvYnFFTnBtM3ZoVWNt?=
 =?utf-8?B?NnFJZjlCcDgvc0VTU0xreWE3TDM0TndpZFFBWFlHb3NjZXNaOWVOTVQya2lE?=
 =?utf-8?B?QnE4TitqNkhlVGJjbTJaMFMxMUVFcDZKazk2ZFZRdlNJdXZid0VZblBSNU52?=
 =?utf-8?B?TDVPd0pFWlVlUS92clVXTFI3eUgzVHRBRW9McWJSN1RTc3ZxZitoUjcxZTZi?=
 =?utf-8?B?ci9kcjc0UlZTZmFSY29iaHBaRlJNbWJnT3RXWHFBM1ZlaHkrL050Z3RDZ3lL?=
 =?utf-8?B?dEFRRG9PaUxjcVlIQ3MxdzBORkpGU3drZ0VyTnJWd2VjRng0SXlGNFJ6RGE0?=
 =?utf-8?B?YTgxbHY0WkliYmFaQ0ZyYklMRjk5amVhb1NQSzFiNmNFU3doQW5kQUp1bzNu?=
 =?utf-8?B?VG44b2xPcHQzdjRyZlFxQkFZSUhOQllDVlVXdnZQT3diNnpKL0t6SysxR2lO?=
 =?utf-8?B?WG9DYUZyUktrWWtndit3WDc1aDZQeGlZKzVYMEowckRPdWdWU1ppWDErLzRh?=
 =?utf-8?B?YWRlZ3p5N05rY2NsVkc3VXgzOUJ5eEl1ZmFDRjFBZktWQ0N0Q3h6Ykt1b0tz?=
 =?utf-8?B?ZHpzK2plYjd6SGQ1eEdqdHk3bTgvNHhsQ01DNzNUazd0OHF4QnJtMlB0d0FQ?=
 =?utf-8?B?UkhxaVo5bVp5d3BLc0U1amkyTkNCUHg2MG8wMXNJNmFtd0tZc1JUTTRmdWJm?=
 =?utf-8?B?NHI4NFcyaGpjR2p6T2c0RHJreFRndnJTYkc1bXZKWERqbHlTZHBBc2FPeUFQ?=
 =?utf-8?B?SjVuMzhIK0lOeGdVYnZNdlllOFg4cGpPMUpmRWUwUDhiOWx4TjFoRUF2S3pw?=
 =?utf-8?B?V2F0SDFSR3FyVlZ2Q0NzVndwVjF5cFhOS1RTcE5sTFRpRldieEVIYnpFcU43?=
 =?utf-8?B?RXc9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 4e14714e-1e14-45ac-1d99-08dd34861fdf
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jan 2025 10:28:02.4439
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3TfAgx0oWz4SlY0c2+0oGnbTJPddLHs07DPo+fLlIJGV9c05Pl10iWqOSNd3E4u95tWUWIC4DzwcLhLyCu/MlJL1oxZusZakD1eSIZO/RXs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7993
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 14 Jan 2025 10:28:14 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6103

Hi Antonin,

On 12/20/24 1:16 PM, Antonin Godard wrote:
> This variables holds the value of the `console` kernel command line
> parameter.
> 
> Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>
> Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
> ---
>   documentation/ref-manual/variables.rst | 13 +++++++++++++
>   1 file changed, 13 insertions(+)
> 
> diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
> index e8db89f8c9642b1e36c574e1369093a7a2ce30a4..b31abeced4cc9b692f8bed814891a267c73f29b7 100644
> --- a/documentation/ref-manual/variables.rst
> +++ b/documentation/ref-manual/variables.rst
> @@ -4578,6 +4578,19 @@ system and gives an overview of their function and contents.
>         You can register custom kernel image types with the
>         :ref:`ref-classes-kernel` class using this variable.
>   
> +   :term:`KERNEL_CONSOLE`
> +     The :term:`KERNEL_CONSOLE` variable holds the value of the ``console``
> +     parameter of the kernel command line and can be used in places such as a
> +     ``wks`` description file for :ref:`Wic images <dev-manual/wic:creating
> +     partitioned images using wic>`.
> +
> +     The default value of this variable is extracted from the first console
> +     device and setting in :term:`SERIAL_CONSOLES`. If nothing is found in
> +     :term:`SERIAL_CONSOLES`, the default value is set to ``ttyS0,115200``).
> +

Missing opening parenthesis (or spurious closing parenthesis) :)

Cheers,
Quentin

