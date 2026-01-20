Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0731DCA5FB5
	for <webhook@archiver.kernel.org>; Tue, 20 Jan 2026 16:59:48 +0000 (UTC)
Received: from DUZPR83CU001.outbound.protection.outlook.com (DUZPR83CU001.outbound.protection.outlook.com [52.101.66.19])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.11190.1768928379329041149
 for <docs@lists.yoctoproject.org>;
 Tue, 20 Jan 2026 08:59:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=BYKMLR/E;
 spf=pass (domain: cherry.de, ip: 52.101.66.19, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KAlJdKi/cxHOCTrGDug7yZozUOXqkD9eZIuR+qjWwLT1b0t6gKSz3cRJ+s6AOS2+A4XkrPU95+Bi9psAyDsDbuMd6xvxjPXYC0xETG3cmazHon7x3r7dYbHm9Icxrx1UWN+fVbbpoMp5swHmoPN0gBRsggrPFo0xWxoxjHsZHVLd3ed24R7WkvzriZT0jauAOsLWf1sgEUAt5m9mFdQm6ylfQ6J6ibVqrTgFIWXgCB3SpttcoihejfHL8xeWQRdPWOzLUPDPmfyN8ueshKl4yTP6eQELyRsHFxyqR2whGmnBck5EQlBm+8YSr/4Vlzn1bDeVArPbpV/zfAUsBG2ihQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YVi8AnqovPl7SaDO8vX/2CQ4e3P9JZC1E9DOHSlbxmA=;
 b=NfAbla6FvkcISolODkABDkLecry0OM2f59aG4rhS0G89ttcULKJf+EEpU5kR1dMd4tmiD+OSYicPUv6YJ+6HP1rU7LDfk+JWheyewbuo+l/l9XbTam54SuMpmoIpy/XSQxHJ8adlRXGgN6UzurC6kHvFXGhLuJA8AMmIkFDkGV20LwZoQ565REnOt7jTb7Cr9dnRQrPweQpinlJbHaDWRnFlZnnofN7fDUGvZ6BruiM2YPqrdvtWI2/cnYx5/5pxBV7gED95ZZAmc0L7ALfUxPH1lP9r17Ihu+djgwJr7Hkc67NVydLZymTyAGkQ4g3Rh61afmlkZyUJdYyzDs12wQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YVi8AnqovPl7SaDO8vX/2CQ4e3P9JZC1E9DOHSlbxmA=;
 b=BYKMLR/E5zQHAUXsB/z0kVlOcS4BcIN6mrrcoIzAjrhXaZbkgSuQHcAA0F7Kz5BJVxqIl66TjeQpVKKPjhXI+4ftnoAqjvx7aX6r3/vFRWGzdZTBAT1LNFRo66gLOEDf5M0RAVVVg70IehTP8Skl5VlKq3ICAuV11sdS5/adZP4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com (2603:10a6:150:2be::5)
 by PAXPR04MB9256.eurprd04.prod.outlook.com (2603:10a6:102:2ba::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.12; Tue, 20 Jan
 2026 16:59:33 +0000
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::6c04:8947:f2f0:5e78]) by GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::6c04:8947:f2f0:5e78%6]) with mapi id 15.20.9520.011; Tue, 20 Jan 2026
 16:59:33 +0000
Message-ID: <2ffff554-09a1-42eb-ab2b-de1254983776@cherry.de>
Date: Tue, 20 Jan 2026 17:59:23 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH] dev-manual/packages.rst: pr server: fix and
 explain why r0.X increment on srcrev change
To: antonin.godard@bootlin.com, docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Robert Berger <pokylinux@reliableembeddedsystems.com>
References: <20260120-pr-server-increment-details-v1-1-fa5d288def24@bootlin.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20260120-pr-server-increment-details-v1-1-fa5d288def24@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: FR5P281CA0022.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:f1::8) To GVXPR04MB12038.eurprd04.prod.outlook.com
 (2603:10a6:150:2be::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR04MB12038:EE_|PAXPR04MB9256:EE_
X-MS-Office365-Filtering-Correlation-Id: a7cbd8ff-af85-4b29-3dca-08de58454924
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|366016|10070799003|1800799024|7142099003;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?YXRHTEYrQ3MrdFpGTmVlSVo5eDN1SWp2OHR6YThrdWhuWVFLcjZoZ3BaRTRG?=
 =?utf-8?B?Q3NUaFUzWEFXM3ZhSHdLUHJKdkRydFRsU3A5ZXh2ZGRaWXBmZk5lUDIyeWdP?=
 =?utf-8?B?cWpCRWJRYjN4dk9wYzVTY1NBZThkRnE4a0M1akhDWlNUOFVaTnBlVW11T0RI?=
 =?utf-8?B?b2R0bGZLeDE5eGg3cHJkeDBBY2NkcXhXNFR4clYzOXBMWTdMazg2RFNabGo2?=
 =?utf-8?B?RkxsU2dtdERhTFgvVDBVb0QxNS83TWFiUWdWcGhrT0tDaHlta0VWVHY0Wjgv?=
 =?utf-8?B?dDkreVV2bnJTdFNLMXg0ZGY3ejZid0xYaUs0SGFPYXFDd054eVkrajM5aVBi?=
 =?utf-8?B?OTZOMi9SL1V6SmN4MkRzY2ExUkxSbkI4b0gwcW1kTyt3d2M3ZEozUlUvYW5M?=
 =?utf-8?B?T0Vjd04wS2IrZzVJTTUrTUJ1MkRPaHRoYUMwRi9BMDluWjZrMWluSHAvOFFI?=
 =?utf-8?B?VGJpTjFheCs2Z3hVVzdRRElFODhkVktCS1k2eUVHSDYyTW1oYmNGT1dYTXZJ?=
 =?utf-8?B?YXlSUjBKK0xLMENmS2c0UC8zaXBudVpVWDNaQzl6UzRsNER4SDIyMkNkUXkw?=
 =?utf-8?B?SElMd3d6Z0xmRGRxd3ROQVd0RUJ3RkxzUHV3dVUvRjNFd2R6YS9wR3JSblNm?=
 =?utf-8?B?eHlrQTlLNWI5K1NjKzVKL0FELzZXVms5TWxEZ1g2MVc1UGpkQWZ6YlBrV0xj?=
 =?utf-8?B?RDNDRXdnd3V6TzVlc3dLbU9xQWJZNUJuMDhjbXVPeUhxTmFENjJxMGJJMXVR?=
 =?utf-8?B?MjFKZ3MxRlplV1VqSjlPb2NVTlllYU9Dc3d5OThSQ24wVDJDOVk3d1lUanBF?=
 =?utf-8?B?TmRIVlhwbmxMUEw4dzE3dUpiVHFUVUhFTHlHK050aVJYb3FJMmRHdmYyaE96?=
 =?utf-8?B?NWtBL3VScUIybHpwZVRkQkJZMUppTFI2WEExSHRCUUZYcUhTNXNNWHlZcmYv?=
 =?utf-8?B?SFJjTTNWdFBRL2tiRi9RMG5VS3pLT3c3SDdnR1lwSUF0UlRFTVdRSzZWT1Va?=
 =?utf-8?B?dU9RZWhWelEySTg3MFR6MkdPY0dUQkRKRzJTU2UrMCtQdkQ3VXArdENLRGxV?=
 =?utf-8?B?WEpTcW1peXVTcGF6QmJLNmtOdlVPYXNPeW9LWCtQTFQwRVBDZW5NaCtLeG1m?=
 =?utf-8?B?dEVEMVYzK1d6TXRsSnBHQ0Z2bVZuQkVDbG1udHY5QThXcVR0U2ZSVGN2bUpw?=
 =?utf-8?B?MDJoODVTNjhlNWlKY3g2SXlNa3pFdXMzSjlXTnZTWHY0NmF5Z292dlU5R0lx?=
 =?utf-8?B?bHJlWDhoZ1Y1MlVWZVFDZG9MV1g5bGZaUURmei9DcjErNUJVLzB0RERrQjJI?=
 =?utf-8?B?OUgyMVdzRUV0dWFpVUxxS1RRVnhNWlZNeCsrWDVuVUU2bk1FcGMwWXNkdURi?=
 =?utf-8?B?dldVTENrNE1KR05YNVE0cTFsMXhnQnllN1F0V0N6K1RjSXUrOER4aktrQzM3?=
 =?utf-8?B?cmtBOHBZODJNMzFWZnhJQjBmUkV4VTVhMkRmc2VDT1NTT1E3YXNiNzk0d2g2?=
 =?utf-8?B?dytsTnlqalRLVENxb1FMQjFDaXhOdk1McnZ6S0tUWHN0Q2NLRGlveGRuRFNq?=
 =?utf-8?B?c01kS3ZIRGJNYlhrRW94anBjTWlheE44cjVuZnQ5cnhURHZTSUF6U0w0aFZZ?=
 =?utf-8?B?TytLZjQwZWROc2g3V1ppZHFnL3pJekFqMGh2OEZXMWEzMjFCRDM3N1J0a1k0?=
 =?utf-8?B?TkVSejJkN1RqZmNrYldNSG5ZdWZTYUZlb1lzemNQc0JzcHM3Zkd2Q3puSlFE?=
 =?utf-8?B?OXFlTmFDNTU4aVAyVVRFMXJ4UFJMS0hXK3p1cEtqaFBJcmU3UVV3SDlBRlpR?=
 =?utf-8?B?bVMvYkZuOHFIc3ZGbUFxOTc2ZTQ4YjVta2c1eEdFR0IzamdzenpWOEY1L28v?=
 =?utf-8?B?ZDFCcGpoa3hVcUNWN3RibVRlZXNYazFFYVNvcUh0eEdYYzliTWNMVm8ybVBX?=
 =?utf-8?B?azVZWFMrYzhGaDl5QjZxem1XbFlxVXRPU0JML3o5OUpneU5qODkrZ0c1dzYx?=
 =?utf-8?B?TERLVFhaWmYzR2RpWEVHRkxQblRad0xFWWRVZU9sMmV2THBFMTdrcWR4N0xR?=
 =?utf-8?Q?z807ZY?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB12038.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(10070799003)(1800799024)(7142099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?Nkt3TGZkZjNtQ2NhanN5UUMyWHVib3lWejVHM2lxWnRRYWJxUEZVdDFxdUhN?=
 =?utf-8?B?c3FDazgwSUQ3TWhpZVZCWjcxM0NMbmFIVTlsU0RjdGZZeWVWTlBYSy94MmFH?=
 =?utf-8?B?MURaZ2tCRWw3ektxN1gxNVdqc0FsSzJCZzJKRDgwMGtCZ1ROQ3M2YnBza3Jt?=
 =?utf-8?B?SVErS1lYYlBaT3pVK1hkUFNaMzdQOHZYSUhNSDZPdUxVckplYTJPbzZpbnVK?=
 =?utf-8?B?KzR1dXgrbGxlYXB1WHZ1aGJWbktwbVVZbUF4bmx0UDBVaTdDaE9jRGNTUVo2?=
 =?utf-8?B?b0dQS1UrNENVd1RQU2FuUkFnaWdhUzQzMDNqWXFnOGJpYzZRWjZyWjc4VCs2?=
 =?utf-8?B?eFpoSEFCay9pOGhZV0JrT2xWcnVqOW1mSnJMS0J3eHZsYWdhTE9vMytiTGhv?=
 =?utf-8?B?Nm9qdzkvOWd4RGRkUXFoc2VUTXZ4RXlHcmFpZmtFZnpZWlNiWUpVOHBLa1RI?=
 =?utf-8?B?cGkzTkxwZzJRakQzdWUzT3NUVjQwWUxsdnNQUWVWVDJQT2I4VWhEUnhUM2J5?=
 =?utf-8?B?VTJvd3NNZGpIRmUxZE83VkVnY1BrbFpkVGxxZkJXMEdWTFhxK3g3YnIvdllN?=
 =?utf-8?B?WEVVbG9GeXliNW9XTmdGenRDOWtnb1l3Y2VhdnE0S2lldjhwUzRWZ1BFckZa?=
 =?utf-8?B?YnJzUlZtS3hnYnhtRml0K3ZZYk9iWXNESXF0d0I1aUZiNjh3dTRodVNmL1BR?=
 =?utf-8?B?b0crR3hwT3VmMHpoRzd4OU1maS94U1ptSXhaYXFQWkcxeXlFRkhlOHZ0L2Yr?=
 =?utf-8?B?eWovZTltOEZub0kyMkVLQmF3aGRmSTVjOXA5bWpsYlNjUzVyQlpGRnZHUWow?=
 =?utf-8?B?ZmtZK2txM3hWNVprZGYxQWE3OUw0eEVyT3pkV3FsZ3BOdWlEMTY4OFprMXNK?=
 =?utf-8?B?SnVaN3FkK0dYRXdjRDZCL1FVTFhWZUVSUFhhNjkvYURXejAySG5zZ2tWMld3?=
 =?utf-8?B?NUNoSm5LaWx3VXgzUXhTa1pRdGMwS2ZqUTgrWDdONndzaUNDODJBWlBmdmlk?=
 =?utf-8?B?T2VRWHl1RE9jTEkzSmRxbG54dnhzQjNqYit2b3VXd0l2eXJPNXBqSkhKUm9u?=
 =?utf-8?B?eERIQVhjQWJvVHhlM2UyY2tlZnNWdkdEQjRrMG9BMzd2QXF0SGs1cTBqeWNl?=
 =?utf-8?B?N045bzRxelppVnZmY3NvdXJMSW9QNGNKZHhxQldLVTNNTHl2dzdaWXlhbzRG?=
 =?utf-8?B?Wi9mdmg2bi96Q0ZpTGpIMDFkOCtJY1ZpYncrNmZmMUc4UkVCWnBRbW83MWVD?=
 =?utf-8?B?cTg3dlF6dzl2SXZvTjNUWHYzM25wY0s1OWplSTM0MEFWd0NDbmlSbTVZc1Vh?=
 =?utf-8?B?dUNtbzUwdS9lc1FpdEVkU3JCcHVETk1ibE91T0NUaTdmWWhwVHFuU2xYRGth?=
 =?utf-8?B?dmdJOVNUeC9leVZtVVFqUU1IV0VNQi84RlNlNWl2TlU2c2h1djQwdHo2OGdQ?=
 =?utf-8?B?TlZHVldHR3lkbmZ1WHkrb2JObzdRYUc3SWNyN1VLdzBvWUY5U3B5V1EycXRZ?=
 =?utf-8?B?bTVaVFh1U0hVSUl5Wi85MGxqRnZjOGsxOTZCTFFwdHJ3S0lwRUlQZVBZbHRz?=
 =?utf-8?B?cnpWbHViditmYmt1c1p2NnpQUVZ5R0x4dXExU2MzZFUrUmtJajRSNXMwRUI1?=
 =?utf-8?B?bzB2VE9wWU9UWEZHLzJFTlI0Z0wrY1c4RmFuMU9WTmx0VW10V09ZQk02YTZ6?=
 =?utf-8?B?SitaTG4reEg3dlQxZXVqOG5Ba3NLZlhhdnB1c0M0anF4RnIweFNPZUdwcHYr?=
 =?utf-8?B?Ti9TdXpMQjUwakt6dGRmRG1OeWlXTTgwRFprUjZnUnE5QzE0Nmp2aUdtb2tV?=
 =?utf-8?B?QmxXRDRWRHdMMTc1V25WeEFWa1pNZ1EyQVEyeTZqb2hFcHc5dkREaW9Id2w0?=
 =?utf-8?B?MzZRcUtoeVdkOUpKT1l2M1dvcGZaNWQrbEhha0ErRmxocmg1UHdrdXVVVGQz?=
 =?utf-8?B?d1E3cGdRZ09mVFl1UGgzNXlBdkNtUE1hdmdBV282T01tYUtndTRPWmJtZ3pk?=
 =?utf-8?B?TWhrOGpvb1NzZk9zaE5XYjQ0STI1RGxlU1R0U3lqRkRCajR1bjF0RjN6ejM2?=
 =?utf-8?B?OEdLa0MzbWJ1NDNDd0JsSTFPdFdtT2tramxmOW4wZ1ZSQjRJTjVZeDhQWFhG?=
 =?utf-8?B?T2JTb0pvSlBiVUhTNGEzRVFBZkR0bnp3YVlPREpPYlc5RnBETzN5K2VaQTBK?=
 =?utf-8?B?elJPbGJOSVQrL2cwNk03RW1nM3h4TVpGa0VYbDU0ZmJ1QUsrZ0JQWmdQT0hz?=
 =?utf-8?B?ZlgyUXh5Qm5veTBsK21yYWpRVDhvL1VXQjlqT1hycFllQlJ6RDgzUzRSbzhU?=
 =?utf-8?B?MlZrd25zUCthenB1c2F3WXhyalMrcStPSFFMY3UrTmMvV0xzNm9WTVM4bEp0?=
 =?utf-8?Q?mmhhp2jzmzUmZ+KKXtYAxL76r2hjZs4XgAArj?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: a7cbd8ff-af85-4b29-3dca-08de58454924
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB12038.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2026 16:59:33.7340
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: No0Lo2i0kddi6yHkLgsUXM/fLw614mo7NG3gXNuNSTUNvPyOWUe0ls04BjPWsEkdvBYvy3RBjlNxBjkr+0gYHak2vSfE+jj9N46pUwcTOo4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9256
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 20 Jan 2026 16:59:48 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8608

Hi Antonin,

On 1/20/26 3:39 PM, Antonin Godard via lists.yoctoproject.org wrote:
> The current example of the SRCREV change triggering a gitX bump is
> wrong, as both gitX and r0.X get incremented.
> 
> Why this is happening is explained in bug 15729, which I copy here:
> 
>> +gitX+ is indeed related to changes in the source code.
>>
>> r0.X is bumped each time the checksum of the do_package task of the
>> simple-hello-world-git recipe changes. This happens here:
>> https://git.openembedded.org/openembedded-core/tree/meta/classes-global/package.bbclass?id=235e6d49e5888ad04416219e10b6df91a738661a#n306
>>
>> This line sets the value of PRAUTO and represents the number X found in
>> r0.X. It will in the end make it into EXTENDPRAUTO, which itself makes
>> to PKGR == r0.X.
>>
>> This line calls getPR(version, pkgarch, checksum). Between test case 5
>> and 6, only the checksum changes. This checksum is the checksum of the
>> do_package task (gotten from get_do_package_hash() above).
>>
>> Now, let's dump what changed with regards to this task between two
>> consecutive runs, using the sigdata file in build/tmp/stamps/:
>>
>> ```
>> [...]
>> Variable fetcher_hashes_dummyfunc value changed from '2650ad6714c3f3248abfe9d3daf1196f307ed494' to '4af682a50174f5deb0397847da97d7cdba4ad067'
>> ```
>>
>> The last line shows that the value of fetcher_hashes_dummyfunc changed
>> from '2650ad6714c3f3248abfe9d3daf1196f307ed494' to
>> '4af682a50174f5deb0397847da97d7cdba4ad067'. Those are the commit hashes
>> in the git history of the simple-hello-world-git repository.
>>
>> Now you can see why this 0.X gets bumped, is because of the SRCREV change.
> 
> Fix the example, and detail what gets changed and why.
> 
> [YOCTO #15729]
> 
> Cc: Robert Berger <pokylinux@reliableembeddedsystems.com>
> Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
> ---
>   documentation/dev-manual/packages.rst | 15 ++++++++++++++-
>   1 file changed, 14 insertions(+), 1 deletion(-)
> 
> diff --git a/documentation/dev-manual/packages.rst b/documentation/dev-manual/packages.rst
> index 8bd48c8e8..9c38bc39b 100644
> --- a/documentation/dev-manual/packages.rst
> +++ b/documentation/dev-manual/packages.rst
> @@ -275,7 +275,20 @@ with a number. The number used depends on the state of the PR Service:
>      .. code-block:: none
>   
>         hello-world-git_0.0+git0+b6558dd387-r0.0_armv7a-neon.ipk
> -      hello-world-git_0.0+git1+dd2f5c3565-r0.0_armv7a-neon.ipk
> +      hello-world-git_0.0+git1+dd2f5c3565-r0.1_armv7a-neon.ipk
> +
> +   Two numbers got incremented here:
> +
> +   -  ``gitX`` changed from ``git0`` to ``git1``. This is because there was a
> +      change in the source code (``SRCREV``).
> +
> +   -  ``r0.X`` changed from ``r0.0`` to ``r0.1``. This is because there was a
> +      change in the recipe, which ultimately the hash of the
> +      :ref:`ref-tasks-package` task (the variable ``SRCREV`` changed value).
> +

Missing verb in the second part of the sentence.

Cheers,
Quentin

