Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D923ED25B47
	for <webhook@archiver.kernel.org>; Wed, 28 Jan 2026 11:32:51 +0000 (UTC)
Received: from MRWPR03CU001.outbound.protection.outlook.com (MRWPR03CU001.outbound.protection.outlook.com [40.107.130.37])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.11025.1769599965277722311
 for <docs@lists.yoctoproject.org>;
 Wed, 28 Jan 2026 03:32:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=Ttu0Eh6V;
 spf=pass (domain: cherry.de, ip: 40.107.130.37, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IzTRUOhmOvUKgyUmzg/XjOcSLf/SDc68KCgFiadULhrKXKA2LVWRga3sWUo9rZJBPyAUzqQAMWRglQJHr/HTzWEUL4TDubcY3kwbzg/vJk3kz+znvuANbO/XJ4dvNVUTwB/tO9bHyIVwrlvwnfgoXx3n+CZDrYluPJ7uhbYcB3ZkRMYvDeuvFEpN1LQQkaHmvpEiLolNl954CT46EyH4ruz4MwVOTN3iBnMAkVJXP291o+GfPXqDdDrxu6cLcMPN7WVEzYgvHyzsd1q9gAYMSSgktlwJnAtuu3Jk0GbCUhh36DPXtljusw8kIZvWAbC2OPgewGrERp3h4KaCEQ/OSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=o+pQLhYSc8SAZz8LN4chEXm3ILU/VmFeAoF72eRx0Ho=;
 b=Du6jqTwIkCiDdezB5t3be5IeiDL6+hVP3JMSC+Cn+AAgIEvsTUk1LHsbgQgYfzj9qQIvjjHVPYnCz602IgC3cQm5xa5A9uy6A2ihw2dcU9Pq0swge964g42iN9yRxO/F8QjClG2ELCmgLxuviHKELrF2mSP0C/kAKKcQQeToUrsE4JTzgztD9wu/FwTvj2CYdnZv8RTrTIR6plC7in0Yey9HkwZ4F5+MqMnnlmNTbbS8XecA+r62aL/HV244zEL22lcWOCnhjHq1J1ZChI1tC5x4hHvefu5SFCTcLEDaOeXm4xtxk6hlUWaC1UaON0p5Fzc0Ri+HuDaiU3vazmPJYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=o+pQLhYSc8SAZz8LN4chEXm3ILU/VmFeAoF72eRx0Ho=;
 b=Ttu0Eh6VJ2bNW3nz6r/J59+Sekgjatw1fmZ2L+gesIyJ2SrVU6g0hmx4ZxwkbfEyzjPyoEewTKR8e0miCaw5TRcTu/33Rg3SsND88Oek66O2rqrlRFhSQrI6ekTxrmGS2Jv+Gcm7UbiSlrnbsMn3kHhXOlUvhqGvDDt3TERLpNA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com (2603:10a6:150:2be::5)
 by VI0PR04MB12008.eurprd04.prod.outlook.com (2603:10a6:800:317::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.16; Wed, 28 Jan
 2026 11:32:39 +0000
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::6c04:8947:f2f0:5e78]) by GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::6c04:8947:f2f0:5e78%6]) with mapi id 15.20.9564.006; Wed, 28 Jan 2026
 11:32:39 +0000
Message-ID: <10bf6b77-14be-4664-90da-7876e5edfe0b@cherry.de>
Date: Wed, 28 Jan 2026 12:32:37 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH v2 23/56] overview-manual/yp-intro.rst: remove
 obsolete poky repo references
To: antonin.godard@bootlin.com, docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20260127-remove-poky-references-v2-0-74bf80cc4e5a@bootlin.com>
 <20260127-remove-poky-references-v2-23-74bf80cc4e5a@bootlin.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20260127-remove-poky-references-v2-23-74bf80cc4e5a@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0187.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ab::17) To GVXPR04MB12038.eurprd04.prod.outlook.com
 (2603:10a6:150:2be::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR04MB12038:EE_|VI0PR04MB12008:EE_
X-MS-Office365-Filtering-Correlation-Id: aaa55e36-e7b2-44fd-07ca-08de5e60f145
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|10070799003|376014|366016;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?T20rN0RjSVhKUEFkM0JhN3M0bno0a3BEL2RkVlM5azMvbXhwcnlnTFJrbVQz?=
 =?utf-8?B?UHVZTUNNL01GUzN4UHJsUVhsU1QzNWVIRSsrY2dBZlJ6TFErOXI2WFArUHQr?=
 =?utf-8?B?d3RCVWFyQnhCbU1SUzdROVhhZlBiNk9MSXF5UU1QVEZjbXdvOFM5bkZFamFW?=
 =?utf-8?B?d3UyV3BYTkxoRi9sUHc1bklrdVQ3L2hxbUU3SHgzbVFqenpOVUhkci9rZjZJ?=
 =?utf-8?B?aEtqa3phS3V6UjhWanEyamNzVzQ2dDd5Qk5GN0tXeCtZNVlSRmFmVmpERkVI?=
 =?utf-8?B?WG9ENHRpMmJUMit3U2Zqck1FdUpLa3loN1FwcitXRzRZU0xxUVZYd2xuQVpI?=
 =?utf-8?B?emNkUmZKSEVuNGtScXY2UCthak9Md0VlVXFXKzNYUk5zOFk1bGljVGFlOU5S?=
 =?utf-8?B?aGNKY0EzQ1RXRU5lZm1QWDFieGRPYjRYdU1pNXFiUUsrR1B2ZnYxdWo3MFFW?=
 =?utf-8?B?bHEzSk42blFOT0c1Qzdnc0dUL3l3L0ZDTHBtZ1dNMVljaXMzRFA4TzZjZEU0?=
 =?utf-8?B?MXBOZHRkZ2M5M2orVXdKMWFrOXhjK0tFTU9TcUtTT2hzZ1hiNEVhQWI5dmdm?=
 =?utf-8?B?M0lmMXRTV0tidllBUVJMTWJvSVVMdFlmN1gyMkJDa2xmT3NodVg1d3NKQ0tw?=
 =?utf-8?B?Qi9zZmFGRkp0TytYQ3g3alJvR3AxWE1jSTRoU0xrSkoyS0tSMjBkTHJDZlcv?=
 =?utf-8?B?OXBxYlNTNGlaeGY5a01GUWNJMkNVOUc5NVRQMGJrMmQ1VVZEd0FEOFVFeDU0?=
 =?utf-8?B?K2tkTGREQ0NCLzZkY2lzK0RKbTFUQlRGZXcySXpidFZpTDBBaFFYVGR6M2NQ?=
 =?utf-8?B?STR5djhTbU44OHdQZFVNL3hBTThkSDZUUDJwSXl0STNFS05CbjIxYWdvbmJX?=
 =?utf-8?B?MXdLR24xbXo3ZFNXZVl3eEJtbENqczA3R2lhQUt4dlpxRmpYK0t4SzBZdVdP?=
 =?utf-8?B?dG95YnVLalJuU1E4ZjloMVNJbjZadWYyaGNoY28rM3I4WWhsWjhUcEdpeVRv?=
 =?utf-8?B?ZjlMc3ZlRjlXYW5ITE5VbENMZjZ2Vk8wOW9uK2w3OUovY2xMVi9ZTVg1WXV5?=
 =?utf-8?B?TS9QdmtZNkMwTlNnTzlqUmxLWlllNUxseUdHc3lPK2FyeHU4L0dTT3Y0UzRn?=
 =?utf-8?B?cEo2RkRuUUlVaVJhVlVkSEx3UkVRZER4Sm5LVGVGUURZeTNUeXNTTnM1Q3BV?=
 =?utf-8?B?QUFCN2tqTlRSekE1d0tEWlp5QUtRSkY0OFhnNUUzVjQ3eXJSYU51SFJsMWpH?=
 =?utf-8?B?RmNFK25LWWJ3b3B0VVlibTVqOVNtenlzQmlVZHd4SVZ5cWZNWDNHaVJjYjll?=
 =?utf-8?B?amJDaUpyYi9YRlg4MG1wT1o0TTJIckRXMUpmc0NyakRYS0FIUWkxcENIMy9D?=
 =?utf-8?B?L3JpSHVhYXl4Q2xzNmtRa2xYVXA3TzRjOS9uR0hJeHlEaXFZUWV6WHUzKzdx?=
 =?utf-8?B?RFdPUnN4SXRBcGlITWl6cktaUFJSOFdwbnpuRTJxc3I0VFUwQUlOYXhibUtH?=
 =?utf-8?B?TkhQbnhjZUh2NUNXdDNVRS8ydjhmS1FpV1NScjhCdXQzeGZiQlBlMnAwRUVS?=
 =?utf-8?B?SFRqZFBCL1U3SUVHRXdNN3JmdGtGQis0QnBXTi85Mll3SGRJUWJFZGVCeWUv?=
 =?utf-8?B?QTBXaTZkUzhTM3lXTnJycldmUUllcnh2WjVTRjkzZi9SRWMyYWxzSmFpYmxI?=
 =?utf-8?B?WjdpM1ovNUI5RVZ1cUJaVU4wVnRURjBXOGVEZGVERGJhUXdrckFYL2h1ZEsz?=
 =?utf-8?B?dW1DRmtYbWxzcjlXL2xHQVlHeTlTZytYNCt1RGJBU3BnNXpLY3QrL2IxWUw2?=
 =?utf-8?B?NWFHZ2RBaEE0a3N0NVQ4U09wcTVVTzhEbmtINjRBZGdVbnJ1NTRFZTNCSXJy?=
 =?utf-8?B?MFZuY0NTamMvdks1TzhFeDdaRXVnWm1jNkcrZGZXVi9yUVdSOFBKM1YyLy9X?=
 =?utf-8?B?cGE1UWNYWkVkS0dyNHVsTWpsMjYwOVFTS3hQa252MkhuOHkyRGFpcHc5UWZM?=
 =?utf-8?B?T3ZXSHBESDJtT29raWQwMllLZFRhbUliaHdoeHRyYU8rODlHTFlBRlJVcU9D?=
 =?utf-8?B?WDdiYnpkWTVuOVMveFgwTTA5d0hzZkZVR2gyVVViY0VzWDNaMmRubE9iMmhR?=
 =?utf-8?Q?0RMU=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB12038.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(10070799003)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?L3RKUDYwTURxSWRaYnFiaTdZajl0Yzg3TGg1QStmOEVLdHNVQXNRS3FPdWJh?=
 =?utf-8?B?bU9qZG9CcTB2WEZ2YnlGQ3dFNVVDY0U2MEtWSG5UN2FOQTg3a1VaK25jdHdy?=
 =?utf-8?B?bzhSMkoybW9HWHVudFQ3Q21QWmphSlRMekcrbTJxRG1WemRVSHRud25Wandy?=
 =?utf-8?B?TEg5RGJhb1c3OTRveTdLQkJMdFcrVTNNcWpTK1hQa090QnRhZ1RsOGNOZWlq?=
 =?utf-8?B?aksrenBpSFk0L2xsVnVoMmVhQVJyT2tZS0ViWjJqWW9yRlovbmNoVDFCL2di?=
 =?utf-8?B?aVRGUEVHSWJoRFF0SXFucENZN2tPODBPWFdiRGhYSDF3UnVtWC94RTJBYWE2?=
 =?utf-8?B?blhLSlduRnVCK0swdnBTQ1lYV0NHSEFCaGw1K2xMQUF4c2lwSGxYT0ZGTDFE?=
 =?utf-8?B?VFFBd2U0VjNIaHhyM1ZXSm5PTS9GWGFZZGhIb1p2KzBUdlgrTzdKRVhMdmFN?=
 =?utf-8?B?K3ZldzN5VCtQTnBxQjd3TnVDSGhSQ1Nrd0xvMHAvVktsY3VoSzc1TnFySXBV?=
 =?utf-8?B?L3N0dkRJME5vcEFTc2FHR0VRcmdvNy8wUXNrbjdHL3AyL090UUg0bGlKb1Ez?=
 =?utf-8?B?SElBWWY4clRKZ0E5TFRkVWJWWTYrNXNmL2VZV005NGhzVWgzK25CeGVVY0Jn?=
 =?utf-8?B?T2RZTlZ6bzhkK3U3UXFoYjBFTUpiTU1WV21Sc1FIdzM0aWwxZWZ6QzdnbjBM?=
 =?utf-8?B?eHVtMVJaRG5rbUJuRkJ1Y3lveHYyOXdQR1QrVldkQ1hpQ0VHZG1YNzJwVDI4?=
 =?utf-8?B?dVZjVDhqS1BxOUc3cHNPU0FoOVV5NWEzenJuTWVnaFM4SU1mZDVmamJkbWFt?=
 =?utf-8?B?Ty9TQzNJTWF4cUJEYmhvUGNzaWEvN1MrS1lMVkpxZVNRQVpMUVRSajVlTDVh?=
 =?utf-8?B?TTRZZWJidC92K1hZd09PblVJdmtBTUpZRnBIbFp1bUxIb1BvSEl3eUJsMmFj?=
 =?utf-8?B?VG11NGZhbTl1L1NsaDZTQkFCVGE0Wkt3ZW1meHpOZUN6OVZrdzM0NVBtcEl2?=
 =?utf-8?B?WlNpSnhHcEE2NzIxbENJMmljZGh4dVRvUEI0a05acFM0VTU1Q1MrajhqdlZJ?=
 =?utf-8?B?NnVydEFrcmg4K2hLUDM4OTBBWmpTdlMyeUtNQ24vckJpWkJwb2tPK2dVZ3N2?=
 =?utf-8?B?S1lJQ01iWkkvUmJGbHVrVmEyODdZZkx0ZmRWRElJendFOEdRcy9heHVuZy9v?=
 =?utf-8?B?MUtYZzZkazRjRER6Z3cxaE5rczJ0RnFEaW1oa0UrV0hMOURPZUt2cDYvblR4?=
 =?utf-8?B?NVA3eFZOcVF5VkdqVE4rRy92YzE5VUdUZXVndDRhV0Z4dlVyeW1kbUxjSElI?=
 =?utf-8?B?ajh0L0l5U0h0L2Q4d2NJL2FxUkR3WFpMRDRKT3RmaTVCWXh2bUVVU0VHRUQw?=
 =?utf-8?B?bVdsNE5tN3dNckxMWSt3eDZCNEtaUGYzMFEyeGlGUmwyMjZiVXBxaStTZUtF?=
 =?utf-8?B?YXNldEF4T0l2THdzN0poYmZzQ0tPWFNQaXZjVVN3SmRJbEd1US9kcnZKQloy?=
 =?utf-8?B?N1JUK2tkWGNaQXlzTnd0bnlubFFnamVwWStUU29TaE5CVlA4ODV3dUNGRWtq?=
 =?utf-8?B?TURRenU2RGd4OXI3VHZCU3hVUmdVcnVVYmhRUXdGTjhTNDRQNkM0cW4wODBY?=
 =?utf-8?B?MmRXZ3NSeXpRd1RPcjYxTU9QMFFMT0VUQ3IxTC9kSTl1MjlIck04RXpxQURz?=
 =?utf-8?B?My80Tjlaa3dtaU8vU3ZmS2VQVjRscUxxN3UyY1o3M1djR2pVUUMzcGdody81?=
 =?utf-8?B?azVVWTFjQk5qcnVUbUdHeVoyZDlXRWRzRlBjZFBpTm0ySWVJeHk2U0wrOWVj?=
 =?utf-8?B?SHIwR0JIS1gzbnhmQWZwVFY0VkhGbG9pMVZUQ3JjNmE2TVZUMWJQMUhPejgr?=
 =?utf-8?B?cnAxaWd4Nm1GWUQ4MXl5VWx3Qzg2RjVieFRTMElrWjJxSkkvTGdrY2ZKRXZh?=
 =?utf-8?B?bHVaM0ZTS2dEZmtMOVpsUTcxd0hla2JURXo0ZUttU09CMHhoYXEyWHoyU2Fv?=
 =?utf-8?B?Q3Jaak9zRnNaSG1yOWVhbXhsWUExODMzRVVzRHBkdzU0QjhNNUJjMkRwSHZi?=
 =?utf-8?B?czU3cVdZWnpaMnowS0JOK2tWQUR3dlJGZFFiRzFPazRGRTVjdnVpOS9Dc2Rp?=
 =?utf-8?B?MmtiNkFjV0xmK3JvcVJVYmZtcTFheFRzRFhLc251NTNHQ2NWWHN2dmkrMkFo?=
 =?utf-8?B?amR0SGpGMzQ2a2JJWC9tRHRwZkU3ODdYamdaU2M1UGxWbHlZcGNaUzRwU0Zu?=
 =?utf-8?B?Qm9NcHdtOGhNb1hVSU9jVWRaNFpLcU1TT0tsdm1MbW41Y1hsTlFxNnFQcVFJ?=
 =?utf-8?B?T2x3NWlJQng4YUpWM2tnZ1RUa1BaN0ladnNXQmpzcmNOWitwVlAzNzlaa2cr?=
 =?utf-8?Q?/8CoZv5x6AyYvCxBOywx8Z2NsEqO3Ns8cOXC/?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: aaa55e36-e7b2-44fd-07ca-08de5e60f145
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB12038.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jan 2026 11:32:39.2384
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lw3XYAsCbSXP1mGUXCVseOWUQVTpVjDvz/PmCva/pfbLIkM8zEt69JFVssJcjcqWhi/HdIeQKJaqb1C201ESREdT3Q4/80YGH8gAxgVMV6w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB12008
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 28 Jan 2026 11:32:51 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8757

Hi Antonin,

On 1/27/26 9:19 AM, Antonin Godard via lists.yoctoproject.org wrote:
> Remove references to the Poky repository. This document had a lot of
> reference to it, so a lot was removed. The "Reference Distribution
> (Poky)" section was removed as there already was a "Reference Embedded
> Distribution (Poky)" below. This section was simplified as now Poky is
> just a distro, not a repo. The historical section was also updated to
> mention the obsolete Poky repo.
> 

Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>

(already given in v1 and no changes between v1 and v2)

Cheers,
Quentin

