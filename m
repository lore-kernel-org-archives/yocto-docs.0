Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40279D6ED2B
	for <webhook@archiver.kernel.org>; Thu, 21 Nov 2024 13:20:33 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.41])
 by mx.groups.io with SMTP id smtpd.web11.10402.1732195225440573311
 for <docs@lists.yoctoproject.org>;
 Thu, 21 Nov 2024 05:20:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=Ws9h/v/F;
 spf=pass (domain: cherry.de, ip: 40.107.21.41, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fGo+VOtXrZnm5gbr6SroCA8e3rATNsu78Y/9tKBnMGTp5tIcgDkCJD/gKfR9hb+VC5EPxGg+TZIBWxARnYeoLdBqXyWTO6uJgNYBnu0lTf//3IjmOTB/UXoy045jUnvDl4kUt9hlzt2bM52DvdGfWgcu5S0IJX3ZKeg8VIznjC+nVfh6GnRF8NKA4rM0c/2Q75oDzcshSuhyLIImn8HsHA0foxbqvmYB1DEG7b71sEK60Wq9Yr+BMcTKCsD29ouVP3t7CVPnwdNiL45qQDuLLanSkCwOMoOj3Q1xCE6PJVxONKbaLH6LNCOrM5St7rDRE1r7wt3+WQPbhXVJXYVMQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dr0lGLZZITAKrCxG7sUn8FmQiyz/YZOadcuDcqs5Txo=;
 b=x9FozT6CBTzvTDcHY1eq4VI3sCz5xxBXeXQT8oS9NKPGOUEboQ89RgRp0E4cn2YyihaI+wFHWSMVqJJBh3QUiJNLPL2Tzw43wSKTiZ7JU7uBiysSDO2uF2JI7Bf3DqoMNOoNsWEIo4ylumB4qrkVpX2QKubRHUL9WGZkbAj4s5ah1XBhlPjNDE0qNDNGPpMoQK4J59JXiemQTxOy71Vbjkwo8TSStWiGZrRYvthAatLYSC2/eEuSnmCH0iM+OptPHDTl8ZyPNEOl41kr/sE2NFZuQQaxXvuMOcbP2pp5kW+exO3EpLq6FoHQXKjT4/8RvMTFQsmTIruDttCDinKDKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dr0lGLZZITAKrCxG7sUn8FmQiyz/YZOadcuDcqs5Txo=;
 b=Ws9h/v/FELUclzlQ20+GyP+Ve/3qV20opkzz+FrRkpLI9ronv6mU+0E+F1CrEANJDrjSYWidapWURiXyYJBgR8YpIKXMDpnI3aSRhg6wOFB4+3wV0xWHVdhgklpEJTMkghDKQpL4Zoo4Q6pcpvrynvARjsmgnBxxA2KSKb3LUZA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by DU2PR04MB8552.eurprd04.prod.outlook.com (2603:10a6:10:2d7::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.27; Thu, 21 Nov
 2024 13:20:21 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a%6]) with mapi id 15.20.8158.023; Thu, 21 Nov 2024
 13:20:21 +0000
Message-ID: <ead684bb-ff93-405c-9bd2-44c96622f559@cherry.de>
Date: Thu, 21 Nov 2024 14:20:20 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH 2/2] migration-guides: document
 ZSTD_COMPRESSION_LEVEL change
To: alex.kanavin@gmail.com, docs@lists.yoctoproject.org
Cc: Alexander Kanavin <alex@linutronix.de>
References: <20241121123227.681233-1-alex@linutronix.de>
 <20241121123227.681233-2-alex@linutronix.de>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20241121123227.681233-2-alex@linutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0175.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a0::12) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|DU2PR04MB8552:EE_
X-MS-Office365-Filtering-Correlation-Id: 2f754a53-e21e-4fbd-2505-08dd0a2f4029
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?Sk52Y1ZlY1NDY1dkQmRXLzk0aXpGWVRPejRUcWJHclZLT3lUQldyVEw2ek9o?=
 =?utf-8?B?WlduU3B5N0cwTm5LMDZqYlcra3FpL0RSajY4TkdwTXQ3T2diQ1JRMzhScE1j?=
 =?utf-8?B?OWd4RU12bkY5Z3VoVFl2MlRXWXY4VlorQmFuZVFNYStiemZCd0dCV2tkUWk5?=
 =?utf-8?B?SjlOWHlWRXBoSWd6NnhkdFpJcitkb2FFbVcxdVZzbm54eG03eUt2emtkYnVI?=
 =?utf-8?B?Wkd5ZDc0cGxvZU5HWnJIYks2Nm1RaklOYnZhckhuQjNzcXh0T0pxYXlPY3dx?=
 =?utf-8?B?cEdQRWNacjhTYTFJR0JSTnRuQjI4UThvQlBkMzVCZ3BFUHBPblFHVUJmTm9T?=
 =?utf-8?B?cmRzbkllUHBWcXJNdWRaRW5OVEZLT0lDRVk2TVFNWUEwcm03VWh6NlJuSUU2?=
 =?utf-8?B?MXk1RmxqTDBzYlVxUkVLN1plc3FPNEVtdDJCazlqa3BUK0xnTEtzekV1RHo1?=
 =?utf-8?B?WGQxZDRkcXNXb0lkYkY3ZG5mUVZVeDNwekRLWUp4a1VBeFdBODlrMWFOanZR?=
 =?utf-8?B?Q2o3VjYzUU9OYWFCYm5vNWdJQlEyUzlKRWdVS1htWjVEOS94UHpjdzJTQ0VJ?=
 =?utf-8?B?MzZSM1UwNG1UQy9YaW5GdEx0U3ZtREdlK2szZDBRMHB3WVVvelRuVEdiNHpU?=
 =?utf-8?B?WHcwSU5jNGVnKzViT0VxWjdEcUIzMHBVb0xiM0xqNXpBN1hPWjJxcmtZQXdK?=
 =?utf-8?B?bWZ0QndGSUhZYVhyZmNGcE5jZ3BlSGlGODJjTnlrT1hxTjYvT2NTeXNtc3NI?=
 =?utf-8?B?bCt6b2dkdVhvcURERCtkcXk4TFV5UjFrUkZyYlJKUkxGc1JuZm9mdU96UDZR?=
 =?utf-8?B?clNOUnpZbVg3RDJiWlRiVFBiWmx4eGFpRG5iYjlNMEFMS2JTWjJkVjl0ZkVU?=
 =?utf-8?B?djhvVS9CUkpUZlZMNjI5SDUrbTZiOTR6bHNyeGlFekRFQkF4NFFsdDRKTjB5?=
 =?utf-8?B?RTlLMU5LRURkTmVBT2EyMFBKNFdtRklKbHdQdXNXOEd1ejl5MnB2MVRBNTlB?=
 =?utf-8?B?dTFRYlJxMVB1K0RXZHppbkRiQWY4cFJLU1hCcnQ3bGp3L3QyUkVsL1diYlZG?=
 =?utf-8?B?dzBxdlpLdHpNbWdvNVFoVzlCMmNzT2hnK1hDZlRlYmlqWUlJa09SUzVWVi9x?=
 =?utf-8?B?bG01MmJqVDYways1TXpwTE1udVQ1R1hhTlpwVmJZNUNqbXVBM0ZVMUYxT0dD?=
 =?utf-8?B?N0FnczNidUluQlVkUS9uaUxPcDhndnV0QllpVll0M2IzTUcvTGlQQk41YVds?=
 =?utf-8?B?ZU0vZ1FzSHdaSzBkdnlLZzJmak1hT1hzVDRLSUNIRVpBMzRlMzBVR3RSTmNJ?=
 =?utf-8?B?K2tjbDNHSHJ0elVXWHBwVXR4Zi9kNlZjNW1oVTRMS2R3UG5Qakk2cFNyNC9Y?=
 =?utf-8?B?M1FURFZKbE5pZjd6Z1FiZE9NTjJvZ1UwMWo2ZW16MWFSNFdBazJWeDBqNVlo?=
 =?utf-8?B?SktZNDFvL1NsZWt0TFZnUE5Id2tqb3JRTGhVd0tOdm5oa3lGQ3Z3V0VRVHFZ?=
 =?utf-8?B?M1N3YVBGcDM0Q1B5VTg1aDlyZGo5UjNyL2tSOHNmNWlQVm81V0dtMGtyUi9p?=
 =?utf-8?B?ZHJLaEIvYWFmNDEvQ2dtZjhPVXFnd1FhbnhCZTBONzdSVE1JRWVnTDJIbmxm?=
 =?utf-8?B?MHN6SGV5R3I4VnNBViszb2tubU5sbzVJVEtjNHlJUk5oTlJ4ck9GclFMdjh6?=
 =?utf-8?B?cVpIekRLM0VMMFNLYlg2b1VmcXVLcTBpcXlyUGVYWEo3b3gwR2hYMktsSExa?=
 =?utf-8?Q?vPsAu8PR4Ec7+XYm5FaQQq2hrSJRLrn2kjGugyl?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8897.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?c1JWRXFJL3QremtCWG40L1cxSnp1Rkk1VXdQb3JjQUhhaHc0TGhhQ2JacWFa?=
 =?utf-8?B?NVZrQXhCZyt0ZXBzZ1pNU01qcWRPaTFqRnplSVFBS1FhaUtLRklmVkRqSWNa?=
 =?utf-8?B?NGVQRk04R1NibHZKNXRkVzIrQlpIN0NRd2I5U2Y5bDRvM2FLYzVHUWZIeUVJ?=
 =?utf-8?B?TG9zU0N2YXNVSVRQQXhwa2hoOUxwaWVXZ2NjVEdJS1I5KzRTRHJaNzRMRGdM?=
 =?utf-8?B?WGFlUDhNWGRmd2pnTk9aQnh3Qkl2RTAxMVhMeGsxeU9mdXk1aDZJNCt0UGtG?=
 =?utf-8?B?TmxFdHpiNGlQVVcvTTJRTmxYdyszYkw2Qm0rQUhOTXNld3IwYjBzUjd4T1Nz?=
 =?utf-8?B?cEozOHdIeG1wMjBLUTMzNmtVWVcrNHhZa0p1K2FUWVN2dWJJclJtWCtnYnlC?=
 =?utf-8?B?aWZ4V2hvQmxCY1VFamVNeFl3SDlRNGx0eU1xbjFKTzJ6YllpR2VSczJ2TWlB?=
 =?utf-8?B?V0RzcGg0cjVNUEJTN0U5bTBDcmhLTkJPdVAzR1ZoVTBWaExFVmtxc3JDWWVn?=
 =?utf-8?B?em9HTnJXeVY3eVNHdTBwd1pZWng4VDMyOENmZk8vdXNIekFYeTMwaHRKK1Uz?=
 =?utf-8?B?NVZYR0h1eCtHek5FdDA4N3FDVnkzWTQzOFkzRFV1OEpmK1pycGc1Y294V0NK?=
 =?utf-8?B?WU9lL0hFUEw4THIyQ2NnR3A2Vys1bVJEQk5xaTgrVXgxRklRcUFaMzRYSlRy?=
 =?utf-8?B?aEw2cnVscjVXakY1WXRTSjh2QzBPWm4xRUh4ak1wMy9wd25JMXh3aVh5ZXlI?=
 =?utf-8?B?OUkrWVZleHpLOEpjdGV3YlNtalBLSW51Z2dHUjc3RTdzeHJqdXU4OURHWlpI?=
 =?utf-8?B?WkFUUlpIekZLZTRNNHBlS0lhWUJDcS82UldzTVB1b2p2ZzFlSm54UnVkZVRV?=
 =?utf-8?B?d3ZLbVJRdnBNL2VqWTd0UVUyMlp3WmpFNDZUdkVNcTZNbXRDTCtsQkJSNDQ5?=
 =?utf-8?B?ZFZQNHdvQURWU2VWOGJwVEFqZk85NXVFSGFZWmJtSEswQi9hV1BZaDk1aEhD?=
 =?utf-8?B?K1JDck1Nd2tpVFduaU1MTlZUWEJ5dVFDSm1jNUY2UitZRmovRldTS09CWExu?=
 =?utf-8?B?QTZtK3ZPL2d3WDdKbjc1cjZ3U0VqNW4vRWtXYmFvVVVaTzMydC93M2dnUFc2?=
 =?utf-8?B?QTE5SEl5THZzaGlyTGd0ekYyWjhRYVptUms3M3Vnczc2T3dPU1FSTzBJUGNZ?=
 =?utf-8?B?Q0VBQU5KTzk5czNQWEc2a1ZXdkZ6Qk5LTG8rV0d5d2FWWlEyVDFwcndhYy8v?=
 =?utf-8?B?NEhwRjNscGJ1cmVIeEkyZHJ4MUhoRzYvUVFnVXBuZGR5TDlGajBvNzV4YUl1?=
 =?utf-8?B?ZU5INkF2WDdpL25KNUdyUVdaQ2xySUJXd1FJOWI0RW81Qm1GU3ZQUTB1dTNM?=
 =?utf-8?B?ZWR0ejJraGE5akhYSXg4WnpXSDB1TVM2bGx6NzFCYnJRblUwREJwb3hkSlFk?=
 =?utf-8?B?bVpUbU1oSFppeFVxM1ZqeXBuQjQzTkpaMTFGbC82aFVUTnpTV2pHRGtFWVdz?=
 =?utf-8?B?SGdFOUdUY2IyalFzclRxQkp2VnFkTERGRjBwZk00TmVHY0FRRTRSOHlZS01D?=
 =?utf-8?B?TXdCM3o4OTRMRmJua1V5L05LaXk2dHMwUFc1SkJzdFJ6OXFxS1JjYTl1MG9n?=
 =?utf-8?B?cG9CMEFhZ3Q5LzZJSzVRbzdNdng4bTFvYTVrdzBidnd5dms4UzJidGdtdDAy?=
 =?utf-8?B?NjhFTVV2aVl3WCtIZmlZTjdUTnFybW91Uk15Rnp0RlorQ2ZPZUh6Q1VlWmR2?=
 =?utf-8?B?WFF2TUZQbmR2MHBESytaVVFnVyt5VlNzeUVMZlR6Qm44dFJuMXdZcmRrelB2?=
 =?utf-8?B?MFkxOG50YldSRUhURzljdlg2UjVIc2diTVNUSG9ZUlNjci95ODFSUzcwM1h4?=
 =?utf-8?B?ZXhiS0lJb3VBNGJNaWhqTElFdmppRGoyci9FbnFaZW5uV2t1cWpzQkhLL3VU?=
 =?utf-8?B?UWlVRG1ucEozcUJ2MzJjNkM0Y0ZWVEVpbEpUcEJ0RlIvNE9VR0praDJ3Y3E4?=
 =?utf-8?B?MnNQa1dBZmJZMWxwamN0enRVYmpCM0s0OU0yMFVlcUdLMXpxc3dNcjFQdlBm?=
 =?utf-8?B?VzdkbFExWFZZdEZwVVdCdzhRcGlEZ2VBYUFYZFRsR0U1TndOWkJ1U3A4bFA1?=
 =?utf-8?B?VlYxMGRGNlplOHBVNnllMXl3VkNxUmhyNHNrQ3BOczRhZFNYMi9LZ3BJUi82?=
 =?utf-8?B?TkE9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 2f754a53-e21e-4fbd-2505-08dd0a2f4029
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Nov 2024 13:20:21.4250
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +J0IO4IVKXxTdMsbm79PxcJ1+mLO8opCLG0xKekGiuvSzCvbo6MstLz/+YOqcBSDnDSXu/KMJe0QNsTH49jBRUpQMhq14bIciDZrzmqbKPU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8552
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 21 Nov 2024 13:20:33 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5784

Hi Alex,

On 11/21/24 1:32 PM, Alexander Kanavin via lists.yoctoproject.org wrote:
> Signed-off-by: Alexander Kanavin <alex@linutronix.de>
> ---
>   documentation/migration-guides/migration-5.2.rst | 3 +++
>   1 file changed, 3 insertions(+)
> 
> diff --git a/documentation/migration-guides/migration-5.2.rst b/documentation/migration-guides/migration-5.2.rst
> index 73d52460f..99330a0b9 100644
> --- a/documentation/migration-guides/migration-5.2.rst
> +++ b/documentation/migration-guides/migration-5.2.rst
> @@ -57,3 +57,6 @@ The following classes have been removed in this release:
>   
>   Miscellaneous changes
>   ~~~~~~~~~~~~~~~~~~~~~
> +
> +- :term:`ZSTD_COMPRESSION_LEVEL` is now a plain integer number instead of a dash-prefixed

standards.md says we want two white spaces after the dash for lists.

ZSTD_COMPRESSION_LEVEL is not yet documented so :term: cannot be used 
here. Either remove :term:, or better yet, add an entry to the glossary 
for it :)

> +command-line option (e.g. it should be set to ``3`` rather than ``-3``).

Please align with the first character of the first sentence in the 
bulleted list (so three spaces).

Looks good to me otherwise,

Thanks for sending the update!

Cheers,
Quentin

