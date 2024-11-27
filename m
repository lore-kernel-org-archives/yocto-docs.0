Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20404D6ACC6
	for <webhook@archiver.kernel.org>; Wed, 27 Nov 2024 12:36:40 +0000 (UTC)
Received: from EUR03-VI1-obe.outbound.protection.outlook.com (EUR03-VI1-obe.outbound.protection.outlook.com [40.107.103.78])
 by mx.groups.io with SMTP id smtpd.web10.70736.1732710997559844469
 for <docs@lists.yoctoproject.org>;
 Wed, 27 Nov 2024 04:36:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=k1b3/f+F;
 spf=pass (domain: cherry.de, ip: 40.107.103.78, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CwwOBOrz1urPZkoyJ7xs1EpDKhb/PXG+XUckUbnJjfZauArNfo00IrIo7o0fwWIIdrX2CAbL3xlpdfNLHMbB9HTZwLlPktrWG4Snof0o2mRf7NserKMMT0Bi5rMIhGAV7UJVO3fcT9s2OeoRX0Cihgr9ILgjbMU2PppO4VTLD3SORbHsz6Lxh8MOUnAT44sXjEUgHJWLX55Ach1U+Q8mWubwGq//5qP4CPvBQGKezrwRsDVLNx4NUvscc/RNGAV1WpKOjp3Y+G9xlq8MJvcMJm2CCrSiLVdQa3gTQkT2rSoqtqchg7i57Bu6EENeTbFuVqmFIhXYH9PGkK24GPF70Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DQxy/JmC6TCMzQwJ+ZG3NyM6MLpyEvWiGSH38l12o0k=;
 b=ivaBoBMcICx1VFBOxYDI85TtYfOerFMvsi1kNx85gmjFnRM/M3aIhlGKM7ZdlS/UrEJe+MzSSwFTY0pEy67tTSsWKJWO1zVcqU1Y+CaMvYzgv4srlolRUeD858zN4ib6YC6JUKrmVGk0IYFY/zWwDm7FAFllkPEU4+DBYATIhNliFCGKUfbDy8CoLdaeRQcQ0qjHjoPB4YWfLY2ruUqg5Z3Xu/ApzyBWSBGtHD9yUw9GwxVjVBzCQ5ezAxjUxk8U+tHSBiVJHzATNMD5kKZvArqEPHMIpQ41r1e2Wn0BXm4JPuVkwLuGMsGZYdjTssqgTCKL5R8yr6f+j6hLjA/8/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DQxy/JmC6TCMzQwJ+ZG3NyM6MLpyEvWiGSH38l12o0k=;
 b=k1b3/f+F1BAWmUbl8baV84ugWGr08gmWBpILOffjMdsbKr/yuRvn7hoJcZctbDJ2j+S2XjE4jC5JrlcVjTRQ8FXYlyFu+bYWYVxVXEcrfuoj06YN7+dcMxRItaGVfzLaJxN/H4aU1QUlt2QKmYgHevaYp53TNuNHDjmtofxCvdg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by AS8PR04MB8530.eurprd04.prod.outlook.com (2603:10a6:20b:421::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8182.21; Wed, 27 Nov
 2024 12:36:32 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a%6]) with mapi id 15.20.8182.019; Wed, 27 Nov 2024
 12:36:32 +0000
Message-ID: <0b545655-dfc0-449b-8cdb-5712a0715f87@cherry.de>
Date: Wed, 27 Nov 2024 13:36:31 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [yocto-docs][PATCH v3] ref-manual: classes: fix bin_package
 description
To: Antonin Godard <antonin.godard@bootlin.com>, docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20241127-fix-bin-package-v3-1-ee09055000ac@bootlin.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20241127-fix-bin-package-v3-1-ee09055000ac@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: VI1PR04CA0055.eurprd04.prod.outlook.com
 (2603:10a6:802:2::26) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|AS8PR04MB8530:EE_
X-MS-Office365-Filtering-Correlation-Id: 8288db88-ab60-47fd-b843-08dd0ee01fc7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|10070799003|366016|1800799024|376014|7053199007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?MGdHa0xlVnZ2bTRhY2EybjZHbVBIS2luMlA1NkZCTGx5U2U3NW8reUNNSXVl?=
 =?utf-8?B?U25PS0VKRU9MYUJFNW5KWEVWaDFTZUdZUGdTV2NodjJrazV5NXBDdGhlUng5?=
 =?utf-8?B?bFFrR2xLdDkrL0JiRDJ2Vmdyd25POXcvRm1nQWkvSGZQN3VuanN3ZHNTL0RM?=
 =?utf-8?B?d0x0NmJUL1E3dmE1eVZJVFRaYUZzMTlLN1pTbHo5U1pxZldjNUtSRm1vdlBt?=
 =?utf-8?B?ZjB3TElRUzdnN2kwUmVrSWtTczk1cmU2VE1SeGcrQXRWT294UDR5VStDanRK?=
 =?utf-8?B?YUVMOXdJbzNHV01scEZKYmczTXNXejlScXVSRHl5Z0c1OGEwaDExZTlVQ0Zt?=
 =?utf-8?B?RTJEK0QyTzBuV0xUcm5VcGlRUTB1K3Y3SnY0UjJua2FWWnh5T0F1V1AvbEhi?=
 =?utf-8?B?ZW1lemNFQThGWTBuREZ3MTVYdEJYVERPb21LaTFPOE9STGQ0K3NKL0NCdnhL?=
 =?utf-8?B?ZFdoMGJXTXQrQkxabkU4TjRxeDkxVzd4SlJlYXVVMDNza1ZQa3pyeTQxaUpF?=
 =?utf-8?B?L1A1b0h2aXpSeXdzQm82a2dQRnJaNEpWcVdwdVhIRXVDeEhQcHg3S0JZdEd6?=
 =?utf-8?B?K25WVTFMMjMvbTZoVlgyclh0Z3h4aEc1MnFiSWpaT215eWhmT0xoY0NUcHMy?=
 =?utf-8?B?ZnZQSDNqTlJUbjVVVWlyOGFUMGdodkMxc1dFY0o2R0NlbGpJVGFOWlVBYVpM?=
 =?utf-8?B?a0ZlK2JHLzJkcGVjZk1FY2tKeVhXYTVQUXNxY21DR0JaVzBzL20rcXJLT0U1?=
 =?utf-8?B?cU1kQTFmTDUxZ2lUZXh1cXZuSGxTdjQvZGp2Vm9nNXNxNzcxQkJFYklMQlc4?=
 =?utf-8?B?cmpsUVhoQklmTVZnNXpyTmpZenVYS055NXMzVEdxbUZzVlF4d2k2dU5rL0kx?=
 =?utf-8?B?YXcrRkVvbkQ2OEc5czA2eVdXeC9XMldMbjFkWURjOWQyclJMbFNDQXdzTFMw?=
 =?utf-8?B?K3g5azVNZ0pYcG1XREhhTDhrcHNaV1BqQVI5TXM5WU8zUWlQRVNSSDBNYW4x?=
 =?utf-8?B?Vmc0R0c2ajloaDE1SEtwVWRoemFNQmNIekJDQWtoV2FmWUgwWjZzMnRGNEha?=
 =?utf-8?B?ZCtDTUd0bjNDTXM2SXcwZERJdTRFdFBETmlDdWh0SlE1MStZT0hPVjBzMkd5?=
 =?utf-8?B?SEVIengyMFBNaTJTRmJKdUJIWDl0UFR2T3QyNklmTERjY2R6eUk4bExibGZa?=
 =?utf-8?B?d2NySWZVT3V5RGFaM0Q3bEllWjVzU2VJQzY4cDE0SEIyZlBuSTd5WGZMKzZu?=
 =?utf-8?B?OEZ3MkhZMEhoUFhrc1R6dDhEL3dncTEvS0FhUit4VU9GR3lWZWJvOFFoeDdC?=
 =?utf-8?B?aHBMcmFZSnV3MDVzSVU4MDVXTlgvNkkyQWw3WjM1RVpjV05DbzUzUzF1Q2l5?=
 =?utf-8?B?UDZVdjg1MXpWNkM1eHp3cWNmL2N6NDlzQ0ZtejFDVHRQOUZ0cDkvTW5mNDla?=
 =?utf-8?B?a1J6MGRtejUrK0pQU3JGZHZMdGprTHRLaWdxSUtMTWk4L0w3ZXR5OWNGQzVQ?=
 =?utf-8?B?amZWTGlaSWxiZWhGM3NxV2txR1JKZ0t1S0pKTnMxZmhBMi9qMkdoRVdwdU45?=
 =?utf-8?B?WHVlNStCTXNLei9PbVR0QktEQnk3THJsZVU3TUFOeWhFdmx0YklsdmlWaEIr?=
 =?utf-8?B?RE41TmsxNEt5Qlp5WXlYeW1SRTN3MzZzalNOMlBuMm5ySndmYjlPNGM4Mldm?=
 =?utf-8?B?VzNRam1HVmVJaGRvNWsxQ1pXREtOcE1kTU5VM2N3K3daQngrZ2N0b3Yzcm1D?=
 =?utf-8?Q?lNB7Zy7cYZ0RSFag2c=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8897.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(366016)(1800799024)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?RW9SNXJDV2xNZmd4M0hGYkxueE1MWDN0ekdVRnpSZW1MaXRRN2JSZkFPM0Fi?=
 =?utf-8?B?MU1qdlFHcUYrb1VBT0hPK0VvMGpZbkFUdVJHcW0wcnkzQkpWbCsvZ05kczhk?=
 =?utf-8?B?dzRzOWM0S3IrV1M2dW1pdVZPdXptN29nOG9hZ3UxVjBDdENSN0M3cGtPRy91?=
 =?utf-8?B?MUorUmNCenBNMWsrUnBRRWdaNGw3bnlOcGZ1aXBXc3RMaVFiMTkrMWNPMCt2?=
 =?utf-8?B?T2g5eUNNY09tVUJaaHozK05tTGppYzZ6QzBPSDVRZmRSQXBXL21jTzgzSDB1?=
 =?utf-8?B?eFNrM2RQZkZncFU0OFUyRGMzNi9VZGpNb3l1bDk2YXJaMk9VT1FMUEw1eTZL?=
 =?utf-8?B?dVRIaXRaL1hkeHpVNUZFQkNrOFRXckdCVDdQVWt1QW5PVXlvR2pQWjc0blVv?=
 =?utf-8?B?Q1B3S2xrUGkxTjdpK3BkZGVxWG4vSjFRTW45N1hlMVlkcE1yVjh5YWU5OEMz?=
 =?utf-8?B?VFhCaThmbzEyZno0QWJjdWRyMnhGQTYzdUlJVWFQYXQxNnBqNVNCMUtabFRF?=
 =?utf-8?B?cmtFTEF2dnFIUjFjTkFLSnNVWlo5QUxTaXNUaUhaaEd5enBZaEovRTRUekFa?=
 =?utf-8?B?ODM4eThjOXVKdUcweWdyckYzUmhWbDh2OFc2YmsyeGpKWVFPYnFtM2NqRWMw?=
 =?utf-8?B?NlhRRUJQMFRhVzkrSFJkNHhPYlhJaVpMUDZGcW5mTlB1a2lSNExhS0orMjIz?=
 =?utf-8?B?cDRJNDVQcjVMR3Q3T1pRQUhYUzdmVVFTQVV1a3FZZU02Q0xsUGhEakRodGhV?=
 =?utf-8?B?Tk9UdW5pWVNtUGxyekxLVk1rcDAzSUVUQWNIamhlRDZXOWkvNzVEdnNuQzVv?=
 =?utf-8?B?akdYNEtQZE1BWEE0L09UcXRFOGJrU0FnVCtoeVEwUVJBOUFiaWdxdTFERnFy?=
 =?utf-8?B?bjdjZ0dIOWRXeHUzbkJJYmVQN3IvWS80QkdSZjBrVVROTU9IK2R4N3p5b0sy?=
 =?utf-8?B?WktTcVdlZE9xb1R1dTNYTy9ucVJDcldWdUhINTUzVmVvVUVTSkJGOVpYTVVZ?=
 =?utf-8?B?SGJERDhSdnczOXR6ZjJ2M1J6NllpOE02OWtQVTR5RE5QV2l0dEh1Z201dkhX?=
 =?utf-8?B?SHM0TWF6VXNTeDZFMUdDQko1eWdrQlNyVWRLZUMxLzVxTk8rWlRUdTN4V2p6?=
 =?utf-8?B?SE11SUppSTVmdXczSm8ybmEzUDc3V0tlVXBxYmZNNnVIdXZlWFNOUkphWHVE?=
 =?utf-8?B?R1BiY24yRkE2WWI4NDkwbEJNeEF5RFN3S0gvS3UyZ1ZmSWd1enV6U0E2YjZI?=
 =?utf-8?B?TDZubzc3cHlhbExiYVpNc2FuaHJ6RUp1ajZ2SGxtUUxLejhQSklDWlRWbmNT?=
 =?utf-8?B?Sll4a1V4bjZwc2Nyb2pSZ0V3Q0JqYVI0RnBkMjJFdFgzR2I5NUlYazA3MTlQ?=
 =?utf-8?B?RU41VjRxNEJJYlgrUUlHSHdYVW5mWHFWNUxLNk1pNzlKaTJrS1VXMHM3Q09N?=
 =?utf-8?B?aEE5SzUyR0k2dlR3U29La25yZ04xRzBRQmtIUlRIQWtoRjhZRTBlQldaclRt?=
 =?utf-8?B?TnB4UTF0b01WbUxLM0xzeFZKZXdlOWR6czJLZmhFQVhBZ3dlUXRoWFYrenRr?=
 =?utf-8?B?QS9UeTZOZVY1WmM2RTVsUUZadlZYZEJ4MlBiV1E0Mmw2M3F5ckRTUVptYjdt?=
 =?utf-8?B?bk1ERTllN0RqNDRpeXNSVkRObmRrSFIwdWFYOUhHTTRSelljRWRaV2xKaFJP?=
 =?utf-8?B?R29TMFlJV3RjYU9yVGZMNVN5bkhQVHYvalR0cUNZQUVuRUhpWUxTb0dqaWVY?=
 =?utf-8?B?VHVyTWw1Z3FMb2xXamNac0tHa3RQc1BXMkEzNElkNWVIN3hQTnJ1L2htNHFa?=
 =?utf-8?B?aGJocEhmWFlodzJ1RkNEWEJXVi8ya1E3OUtzTWdwS0NUemJuYzdlTGt3WUJG?=
 =?utf-8?B?ZEdaMGZuSkR6WDUwTElRRGRwckptN1dXK0wxS0NEWkpkS0J5dVVnSDNmN2pG?=
 =?utf-8?B?Lzd2VG1KdFAxS29jWGU2cjNQaldoR20yU3BZSTVuK0czZy9JdkhuYWR1ZTc0?=
 =?utf-8?B?WnU2T0hING4xWEpEWW1zVTJucERMSWgwMzJiaGkvbWlZWXpZUENub0lDSWVr?=
 =?utf-8?B?ZWtGSUNvOFREQlVHWW9LVlJtdWc5MUFFclhCbnJHcVhyWHZaa3J0Ty9vQzMv?=
 =?utf-8?B?ZTU0d0dwb3hBK3NJZThheDFtanNRb0UxU29zK0RJcjY1RFBkYiszUlh2YXV0?=
 =?utf-8?Q?wxIyIS8KHnO5r7T7LK6hDoc=3D?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 8288db88-ab60-47fd-b843-08dd0ee01fc7
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Nov 2024 12:36:32.6374
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UQEBpeNzdfBy3zZ1qlV65PBfTaOVAlZ1jG/qf+ThhNS7Igm8RzRL/j53fG+Q6KgoqivMqIkYghuk7OjOuX4Cu02l+aljOOOOWN0BRi+k+B0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8530
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 27 Nov 2024 12:36:40 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5827

Hi Antonin,

On 11/27/24 12:36 PM, Antonin Godard wrote:
> The previous bin_package description was confusing: it would instruct to
> use the git fetcher to extract the content of an RPM package using the
> `subpath` option - but that's not possible as the git fetcher can be
> used to clone a repository but not to do the extraction.
> 
> Update the description by telling what it really does and what it
> doesn't do, and by giving an HTTPS+RPM example.
> 
> Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
> ---
> Changes in v3:
> - Actually explain what bin_package does and what it doesn't do.
> - Link to v2: https://lore.kernel.org/r/20241120-fix-bin-package-v2-1-917a5c2745d2@bootlin.com
> 
> Changes in v2:
> - Instead of updating the example, update the description of the class
>    with a more common (and working) example usage of the class.
> - Link to v1: https://lore.kernel.org/r/20241118-fix-bin-package-v1-1-906f0148fdaa@bootlin.com
> ---
>   documentation/ref-manual/classes.rst | 42 +++++++++++++++++++++---------------
>   1 file changed, 25 insertions(+), 17 deletions(-)
> 
> diff --git a/documentation/ref-manual/classes.rst b/documentation/ref-manual/classes.rst
> index b92f4e4f20ea8f702c90f4e3d29251b2461d07d0..ff9979d1f1ac0afb0ee59fcd193dec2c1323e1fe 100644
> --- a/documentation/ref-manual/classes.rst
> +++ b/documentation/ref-manual/classes.rst
> @@ -159,27 +159,35 @@ software that includes bash-completion data.
>   ``bin_package``
>   ===============
>   
> -The :ref:`ref-classes-bin-package` class is a helper class for recipes that extract the
> -contents of a binary package (e.g. an RPM) and install those contents
> -rather than building the binary from source. The binary package is
> -extracted and new packages in the configured output package format are
> -created. Extraction and installation of proprietary binaries is a good
> -example use for this class.
> +The :ref:`ref-classes-bin-package` class is a helper class for recipes that

Would put a comma after recipes so people don't think it's for recipes 
that extract the contents[...] but rather that the class does it for the 
recipes inheriting it.

> +disables the :ref:`ref-tasks-configure` and :ref:`ref-tasks-compile` tasks and
> +copies the content of the :term:`S` directory into the :term:`D` directory. This
> +is useful for installing binary packages (e.g. RPM packages) by passing the
> +package in the :term:`SRC_URI` variable and inheriting this class.
>   

I would also provide tarballs as another example of "binary packages", 
not sure how to word this though.

> -.. note::
> +For RPMs and other packages that do not contain a subdirectory, you should set
> +the :term:`SRC_URI` option ``subdir`` to :term:`BP` so that the contents are
> +extracted to the directory expected by the default value of :term:`S`. For
> +example::
> +
> +   SRC_URI = "https://example.com/downloads/somepackage.rpm;subdir=${BP}"
>   
> -   For RPMs and other packages that do not contain a subdirectory, you
> -   should specify an appropriate fetcher parameter to point to the
> -   subdirectory. For example, if BitBake is using the Git fetcher (``git://``),
> -   the "subpath" parameter limits the checkout to a specific subpath
> -   of the tree. Here is an example where ``${BP}`` is used so that the files
> -   are extracted into the subdirectory expected by the default value of
> -   :term:`S`::
> +This class assumes that the content of :term:`S` already contains the

"""
This class assumes that the content of the package as installed in 
:term:`S` mirrors the expected layout once installed on the target, 
which is generally[...]
"""

?

> +installation paths on the target , which is generally the case for binary

Spurious whitespace before comma.

> +packages. For example, a RPM package containing a library should already contain

s/a RPM/an RPM/

s/containing a library/for a library/ # to avoid redundant "contain" verb

s/should already contain/would usually contain/

> +the ``usr/lib`` directories, and should be extracted as

s/as/to/?

> +``${S}/usr/lib/<library>.so`` to be installed in :term:`D` correctly.
> +

It'd be nice to encourage people to use versioned shared libraries even 
for binary packages but not sure how to word this here.

> +.. note::
>   
> -      SRC_URI = "git://example.com/downloads/somepackage.rpm;branch=main;subpath=${BP}"
> +   The extraction of the package passed in :term:`SRC_URI` is not handled by the
> +   :ref:`ref-classes-bin-package` class, and is done by the appropriate
> +   :ref:`fetcher <bitbake-user-manual/bitbake-user-manual-fetching:fetchers>`
> +   depending on the nature of the package.

What do you mean by "depending on the nature of the package"?

>   
> -   See the ":ref:`bitbake-user-manual/bitbake-user-manual-fetching:fetchers`" section in the BitBake User Manual for
> -   more information on supported BitBake Fetchers.
> +   See the ":ref:`bitbake-user-manual/bitbake-user-manual-fetching:fetchers`"
> +   section in the BitBake User Manual for more information about supported
> +   BitBake Fetchers.
>   

I'm not entirely sure this is relevant here? Or maybe we should update 
the BitBake docs to reflect which fetcher is extracting 
packages/tarballs with which option?

Cheers,
Quentin

