Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9EE9D29DFF
	for <webhook@archiver.kernel.org>; Tue, 13 Jan 2026 09:58:10 +0000 (UTC)
Received: from DB3PR0202CU003.outbound.protection.outlook.com (DB3PR0202CU003.outbound.protection.outlook.com [52.101.84.33])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.55783.1768298288401193078
 for <docs@lists.yoctoproject.org>;
 Tue, 13 Jan 2026 01:58:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=IkgDGgDd;
 spf=pass (domain: cherry.de, ip: 52.101.84.33, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=e8rPzyII2fNNvfXqHOHRVtMDDPsm8UdYFS81p79wZ/VE187dZRfYwKt/OlN9He2Y7yWMFyTZmEgkXBVF4f4H8e453eMr0LZTKQmkfHUR/jlsUPNJBlNDsAujzoRtmhSCkErCCCLqn46D79gdOM7WCCjiggfiFJu6t8NXBAJx9NQIyUWW2yGURA4BcGU6YsZ5UfLTl0wl4U3thzvUCuBbPUwMzl9iIpMhxxmCrgZgMk1uVHih8wcn2bZL4pQGVCnkZmsiWbvVTgcw4bsO376ByWApRIFXh1TdJ0BYeOl0ccvbfeVRLwtGdh04kefceqib/EgeeGHbUbKHSdAJSS3a6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UXiJcRKWYlf/fAtcxwBPWp5Tispf2J9lDk9OOuow3uc=;
 b=LNbEnrwSU9QFsX1KCQdcesQdZvfhfWHDuVNnYcb/uyxCkfxSttxF8iVi8+BMkcj9uS8MIydCgO2cjt2Nws1GHHTs6rFxznPYfU1+2QtsEa5wE3IJ/usobFH0dY6dZ1XenmWhZPqw3OGtZPnl1WR7XdBotf7FSkZBggvESrqLu6pmVnnibeh6LQrtjpGIVJUCnM2xyVno9aasSOXA+0pOGYyj3FjsJsshOe8eVIktMIYXlEMtGZ9D2z7p/+wdSCWRBkskW++Qd9O/3BBaGkeVei0eRzzFWbM1VOnpYHlQAS+dQqajQlcHa1iLnnHZv3XhsjFoiU00Ciil35xi5ELwHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UXiJcRKWYlf/fAtcxwBPWp5Tispf2J9lDk9OOuow3uc=;
 b=IkgDGgDdBJnCe5Mk2TpaPIZOv2itusRDTPwhXBBe4WzlbIjWSaHsu0r4HE0DDCgUkdVkZ5QVy78Agjeb4JU5NJ59qfFtFW5oRebXe7VOSuOfNmHPJ6afEujmOVQTairicnW3ujkb0GQ+unnQ9rdWCsmhDX62nYVPd8GFzPHIA2g=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com (2603:10a6:150:2be::5)
 by DB9PR04MB8203.eurprd04.prod.outlook.com (2603:10a6:10:242::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.7; Tue, 13 Jan
 2026 09:58:04 +0000
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::1033:5a9a:dc18:dad]) by GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::1033:5a9a:dc18:dad%4]) with mapi id 15.20.9499.005; Tue, 13 Jan 2026
 09:58:04 +0000
Message-ID: <8dcdfe1f-aecb-44aa-8a7c-a9337d671f3b@cherry.de>
Date: Tue, 13 Jan 2026 10:58:01 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH 01/53] transitioning-to-a-custom-environment.rst:
 remove obsolete poky repo references
To: antonin.godard@bootlin.com, docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20251224-remove-poky-references-v1-0-658a5f4dbde2@bootlin.com>
 <20251224-remove-poky-references-v1-1-658a5f4dbde2@bootlin.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20251224-remove-poky-references-v1-1-658a5f4dbde2@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1P195CA0045.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:802:5a::34) To GVXPR04MB12038.eurprd04.prod.outlook.com
 (2603:10a6:150:2be::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR04MB12038:EE_|DB9PR04MB8203:EE_
X-MS-Office365-Filtering-Correlation-Id: 375a8e0d-414e-49fb-e43a-08de528a3ebd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?blVrN1duais1bWQxMnlrTm83OG5LY2ZWMFVjYmdmZDR0RHJ0dFZpRjFGV0to?=
 =?utf-8?B?MVczTGZ0MmFUOGZ6YXJrWWZhQVpDSlFIVmFKaXlLdHIwdnQ2d250aHZJZkdC?=
 =?utf-8?B?ZFA3RVFiMU9oQ1BHSUo4bG15bE9pdlpMajZqanZNdkk2ZnY5TFdaT2tjVHVk?=
 =?utf-8?B?aW9RV05uZUxVUXZSenlsaEszSEVCbERuR3JEZzdKN01BaVJTOHVMVkw5cmNa?=
 =?utf-8?B?alVCZ00zM0tFL3hMZ3Roakw0ZXNzd2NlUC9EK0cxZGdQb1dMOVNobGwrN2o3?=
 =?utf-8?B?TUowazA3akFqa1hoSlBaVkdHemRDMUtpS3JPYlJZOUx5SHlHVTE5eU5vcG5O?=
 =?utf-8?B?c0gzN3NNaFlMcUFWNEM1NElNaDhjeThaVGZYZ05QNUtpMWNPa0tyMFFKZ3Fz?=
 =?utf-8?B?VHBGY0dTRUQxdW1xT1pGREZEcU00V2lEN0Z1T1lIWjJjNTBFYVBERHpIcDYy?=
 =?utf-8?B?d0NRVmFpMGNiN3dlRmF2Mm9PckxjS3hvKzVCNVRBY1RuVW5CaGJqVUxTNzJq?=
 =?utf-8?B?eDlMTjdmVWkyZCswTEdSTEUyS2ExNUdsNnl1UW9EdzUwS2ptaitlT2FSYkJU?=
 =?utf-8?B?L3ZIcTgzMlZWazh5VlFwM1crSDZraGhCeSs3a0hndXZrYVR2cEhjb0RyVWV0?=
 =?utf-8?B?U2x3V2FrZjZkUHU1S0ljakM1K1oycUxmankrTzduS01OZXFOVVBxVnZKVHlG?=
 =?utf-8?B?Z2lKSXV3dkRxUDI4YUlKV3FRTm1RQlBkdkVScjVHT2t1eXQvLzZsTVVxb2Ft?=
 =?utf-8?B?cStYQU81Y3h3dEVOS3ZiS0dIUi90Ly9lUHIzRXRFcUU3WUVpR0VaQm16SU0z?=
 =?utf-8?B?VXh1VWhjTmdHMkg0WFp3eDczNHlXTFZkd0FnNlBlNUljUkFweGorRlJtZnEw?=
 =?utf-8?B?MEFLSStvcmJRbkVJblo0QzdYNkx6dXJhU2hDbFltSHlIdER1RWkxVDVWOFNX?=
 =?utf-8?B?cTltUXNVcno5TWJIR0RleVlDaTFEQzZXQmY0VXdWSHhLekFzWTVzaEIvZWxm?=
 =?utf-8?B?RlFERjdDbjdhN1hocWV6MHI3OGFJWlNpR3dTZ2dHVFR5TDRtYUhvSGNMU1d4?=
 =?utf-8?B?WGlOeVd4REc1SEtGR2loNnRYQmhpY0JXYnROSWYvb2RDVjVTYnMzUVQvTDBN?=
 =?utf-8?B?RkoyaldqQTJNc3k0RHVkbkFVdU1WdG5OZXFqTDh0bHIzMDlodXNXVUk1OUk4?=
 =?utf-8?B?YWdwVXNlbFF0WVNUYWY4QVZlUFhvQm1OTC9WU0RWNXRhTEh6SjVWNHgyVytT?=
 =?utf-8?B?R1JaR2dJdVlORFpXS2kvL1F2SzFlakpJcVk2dFhmTXpFVDRmVVpXUGlrQnZw?=
 =?utf-8?B?Z2ZMakd1MmVIWExvaWk3K3ZxNzIxSnFGQlpFdjJaWFdtTW9HTWZiN285UTM4?=
 =?utf-8?B?bmFzdndIZFNCREJzTUo1aDIrVGc2V0R1TVJTUlNaOTJaeUsvL3RjT25QVHpG?=
 =?utf-8?B?UmJqRmp6bzB5SHlnRExwYnpkbmRuTmM2MlExWndiL2NnYWh3cnVFVkN2Z1hK?=
 =?utf-8?B?cWF5bWFENWZGbnRTb0FtTWp2dGQraGx4S3JoVkFmZEorWno5Z0s2TVNtTUp0?=
 =?utf-8?B?bUtWc0lzTDZJMkx0NDlrNHJ1ZjRlTStTWXF1Y1o0WmVTeHd3TFd4OHJyeTdx?=
 =?utf-8?B?aTJLVWRrVmlWZ2MyNjdSRWlLUFIzenpMcGc0WHZINzNPSFkrQjRlVE9LMkRS?=
 =?utf-8?B?Rmt0Y3lCZUdLRkhMQzRCSkpwbjRRYThxU3ZYN2FNZXJmQ0I5MDNIWDd2YUpY?=
 =?utf-8?B?NjFCRFVhZ09qa2xnQ1hyVk04a3hXdU15dThWVTh6UE1MTllUUUgwNTFhcE9S?=
 =?utf-8?B?UkhkRXoyWVR0Kzg1MFd2TU9tZE9WLzg5SmpCMVg5MGVIZGFZNW5kNi9SK3Q0?=
 =?utf-8?B?VmRnSExsOENGSFZYOW04bGJ0WHJEQm5mYjNjMFZUbmRjcm41citsR2x2VGQ3?=
 =?utf-8?Q?7REeW+B65MW7GNWXo+PEAzuBa/FgxSD8?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB12038.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?R2dINUh5b1IwV0U5UHBiT0lnQ0dFbEdnbDJxdWphaWdscERlcVJKTm0vSkd1?=
 =?utf-8?B?RzA2WFQ0bDk0Vjl6Z1FqWVE2RENpbGt2aEdWOE5UVDdlVHBmY2JYcVkxU09P?=
 =?utf-8?B?NVJFK2ZFRXMvV2FvSi9vL0VrN2pQT1NBUnI3SVJjWk5VVm1OOWFkUzVOUlc3?=
 =?utf-8?B?eE92WE9RMVMwTzVhZGQyOUFKNmpvR3l4RkxISElvUS9HeHcxYTJ3ZzhNZWZx?=
 =?utf-8?B?cTQ5bU5WOGZPR2YrQ3diTGpNTm14Y2ozWkZIYklqWGE1alhiMGVINDYyZkVI?=
 =?utf-8?B?dTB6QUNmWkQvNGdFMDZPQnJnT0h0YzdNNWlWS2o3VG0yNEVDRjRFTmNnUFg0?=
 =?utf-8?B?UWdJTWVXTEJ6M1NJZ01MQ1B4aUZoMTdmSG16cHNxcTdXMXRELzlWM3pWYjda?=
 =?utf-8?B?R1UrTFBOYVBFU244dC9sWUtlOFA4V2F5QkJjRWx2OXVSVDRxOXhtajdjcnBU?=
 =?utf-8?B?Rnl2a21uM3BKUXV4SzZFaExPeGNTYVJmeXYxVGdnZlJFZWJwR2Q0MlVyQXUz?=
 =?utf-8?B?ZGVMNlNTL1F2bVE5YittOWZ0L3EzQkxETU9FSXFiR3JZcFNaUDlpaDVRbnU4?=
 =?utf-8?B?QUUwVkcxb1VTc2U0aCs1bzVTdDBpOWRQK1RXM2RXUW05bzUvRXR3dTFiUy9a?=
 =?utf-8?B?aVo0UEZhdUJMaXA0WUNVbzExMFowbmtEOWMyTXhZTTlPUFlUVWlnczdyMjNx?=
 =?utf-8?B?QU5YbnppZlVidmtscEJPVnAwMXVVRGlZb2IvaXJoZ1R6dHRFMmI1aVlkSStp?=
 =?utf-8?B?VWVPc0FPb251Q2VGMXRqRFlJWUhmYzVxYmNkNlJNZ0ZaWXpqdmJObWlJbmpC?=
 =?utf-8?B?VWd6NityUThWMWNLWDNiUGFWWmkrcEh0MFgvRUhrU1JZRkNUTWJjS0RaMlJU?=
 =?utf-8?B?R0dVTURZZkZMK2x6NEZueklrMmRmY3dSSHBoQXVCMVlpbVpBcmNyMjdoazNt?=
 =?utf-8?B?Mm95dEhwc2JTZVRMc3lldjNGU1dQUHVkODVOTEF0MDY2SHUxU3AzNkhoNDhM?=
 =?utf-8?B?c2RzQlB3UHRFaFlJWG5yMTAxS3IrdTQ2TS9odWpBdHI4Z1VxbFlXWmhnM1JF?=
 =?utf-8?B?N1ZOMlVTYjRKdjdzcHpQV2ZibUdqbHhJOUFrcGF6RGlmTXNEZmtXME9BRDlR?=
 =?utf-8?B?empCeUlUZTBMY1JILzFJSk9tRTZtdTV0RVBEK3A2eUs1MXlPcDNsOEVVRXZs?=
 =?utf-8?B?OGMwM0MyRE5NSFRaODVVOThwaFRvanVFUFZtdnMxK1dKcVVGZTlERHpTSy8z?=
 =?utf-8?B?Y09hOHExTEdNK2ZybDh5VWdKRStmNDJqUzlUT3JpVHhiSldhdHhRWFJXWFQ5?=
 =?utf-8?B?cUdCWFRBYThDTG5NT1dtaFZydTZUTW43cFpYanluZGpTWER5NHhKa3hPc0Rq?=
 =?utf-8?B?K0pqNW41bHJlRnUwa3ZraE1LNEE1QXhlTzJYYWxEVmtEc1ZNQkpsZnNTbTln?=
 =?utf-8?B?VE1weGVDTTFiV0RBaTMxSVN4OU51bXJiRnphRGtQMnQxbFVhLy9EcFFtOWxv?=
 =?utf-8?B?ZCtPZlppR2xYSVY5NERFMjlVdzh0T1h0ckU4Z0RNWVNqYjJOa2d4c0htdlZK?=
 =?utf-8?B?L2pvZzVJa0VQQ0hHRURJQkQ4djVuZXRGNlFQaHBnaUhUQTI5TVBvUklCd0RD?=
 =?utf-8?B?andwNVg0Tm1Mc2ZaTnZHbTNjckVnOFkvcGVSeHhZZHMvcE4wNHkxU2ZULyt6?=
 =?utf-8?B?amFoSFlhU1pkdHgxVmQ2RmxFemt1TjRjTytvbUxTR29YWXduMVdLNENnSk9h?=
 =?utf-8?B?MXBKS1BKclNicUhZMWgwZmZFb080UWZ5R2ZTUUl1MGg0LzRnYzcvQ3YzcHNj?=
 =?utf-8?B?eXdPRWZxNUF2WjRJdE1iSlNtcGl4SENMUE51ciswbFhXMHh1a01RYU90c0h4?=
 =?utf-8?B?c3Zua0NucHJ2ZHFLOVh6TDFOT05xcll6MVdZUU5ROHRyVUVXK0hOcjludVA0?=
 =?utf-8?B?YS9CZ0dIQ0JzVUJYRTJSS2JjRERjRmNQK1pWTExQanFMaFJkL1FsR0xNLzc2?=
 =?utf-8?B?NGh2M3dURTRsTWUrWjNQUC9sbDQzREFsVElsZkdLdTRKbDdpcy8zazUvdERD?=
 =?utf-8?B?WncvZ01GR1E2bHJQVjFreDc5elJRSksyS0VHTDFISkx0ZlhyVkVIeEQ2MnZr?=
 =?utf-8?B?RWZ3WVMwT2dRaXZjcnQwa29pVEZnWEtXeXIxbzJhWTQxemZoenJoYlJWMWZi?=
 =?utf-8?B?Tm9oUWRaeExpZUJWVW5mWkhXSkdVMTl1YUJKY1RsTjdJdEU4cVhLbmFyN0RC?=
 =?utf-8?B?MUNpenFYb0ExYnZHRFdUN3BoVGJIZWljT0JXV1RlZnpxVlY0Yk5xUnBsbHBh?=
 =?utf-8?B?dUxMVkFLdWF1Rm13MTREQVpCZ1VxdEZLajl6cU0xU1NrUmF6Y25NNnJ3NTEw?=
 =?utf-8?Q?+D9tmKRtvvAxWEm4=3D?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 375a8e0d-414e-49fb-e43a-08de528a3ebd
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB12038.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2026 09:58:04.7059
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CgqTFciL6dbNnEQ2IFmWgT2WwgDSTWeJCkkXpbjNsoVkjiumeiIqKvWCohblojSMd+SbEVWteBaOSiz7EVVpDB4JjGDDStrlwHq91aRrc20=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8203
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 13 Jan 2026 09:58:10 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8479

Hi Antonin,

On 12/24/25 5:31 PM, Antonin Godard via lists.yoctoproject.org wrote:
> - Use :term: for Poky.
> - Mention use of fragments instead of local.conf.
> - Remove Yocto < 2.4 reference.
> 

A list in the commit log means it should have been separate commits.

Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>

Thanks!
Quentin

