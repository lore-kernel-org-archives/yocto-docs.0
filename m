Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21555D25B7C
	for <webhook@archiver.kernel.org>; Wed, 28 Jan 2026 13:41:03 +0000 (UTC)
Received: from AM0PR02CU008.outbound.protection.outlook.com (AM0PR02CU008.outbound.protection.outlook.com [52.101.72.0])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.13089.1769607657716862386
 for <docs@lists.yoctoproject.org>;
 Wed, 28 Jan 2026 05:40:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=ExcKnnnh;
 spf=pass (domain: cherry.de, ip: 52.101.72.0, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ly+9dTq5e3RmiBjZFd0r8z8eKbxQV7ly+gg7QQcmBy88bPVdj21svDH3jahqX1fskI3A130+iqqB/ceAFyVfuTlmfQENfWHY29ctvLErnN9THlalclftNn3yG7klkVI05tCuUvsvDs65+1Jg/R2PkuuMKSdqRLoCF+BEzP/oe0brIU7+2GcB+az0oIuvZJDmJSY9yEL98lg9ZEN00QTsvztvOxqI6cMCiNcW/SUmcoHk3ug4OC/P0yC9g16iu02znXXTWUcrAEPSnrNPvvueYpe9pzqPOoTBCegQAp/X4dRd26dIQiyek8TS00GBzp+xhYJV7lhdZsYC7GcHuwrvLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=28KNDKKnI7SaqkKfax8s++v3j8O1MitSsn+J1LPz2Zc=;
 b=rgx34xaaM31QYD6fNiPYEl5unlh6D5D7I0prkn4XG5m5HXaTpBZiRhzjnmkCWCJqvKALGeCX/of74YN0dKLgmg2GoDwSNSCI2qYTiqyINCkrNrcsK/K8+aj0437LHxiW1zVOLorrxnnPmce7jX5ZYDvnacOWOivcSlW4IPgfwEt7TgvYiLF4k+bDBCW5h70YqY+Xz8Kic7Kp/Joe4EJged2pYsQr9gIY5QNgm1V9sktycgUvHFOeh23arBfn1CIq5rt+fzJYQ4NPRExI7zeX9WFGm5XNNQN9GJkni3SinRC5a/7SBS0Ibpk2MwVSOMlUIdgrw4Is5bFLrsVR2ySOnQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=28KNDKKnI7SaqkKfax8s++v3j8O1MitSsn+J1LPz2Zc=;
 b=ExcKnnnhMGByA4qD5w+GSKjzElG474Cgk7fs/NfZM7xXLvhioNQ8dtMWfe4BkdFfn1Uz60SEbi0WcBn80EFIoDQdvuO8ZCqSgDeIK7hcQuTOFPSeqm3GTS53UTful7ynY7XB1MVvXxmHVK58PXdgb5w7wJokdq9Bg0EIUIgomZI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com (2603:10a6:150:2be::5)
 by GVXPR04MB10658.eurprd04.prod.outlook.com (2603:10a6:150:21a::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.7; Wed, 28 Jan
 2026 13:40:49 +0000
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::6c04:8947:f2f0:5e78]) by GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::6c04:8947:f2f0:5e78%6]) with mapi id 15.20.9564.006; Wed, 28 Jan 2026
 13:40:45 +0000
Message-ID: <b1d78bde-d3c2-41ca-b70c-715d45d13827@cherry.de>
Date: Wed, 28 Jan 2026 14:40:43 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH v2 32/56] README: remove obsolete poky repo
 references
To: antonin.godard@bootlin.com, docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20260127-remove-poky-references-v2-0-74bf80cc4e5a@bootlin.com>
 <20260127-remove-poky-references-v2-32-74bf80cc4e5a@bootlin.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20260127-remove-poky-references-v2-32-74bf80cc4e5a@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0282.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:e6::7) To GVXPR04MB12038.eurprd04.prod.outlook.com
 (2603:10a6:150:2be::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR04MB12038:EE_|GVXPR04MB10658:EE_
X-MS-Office365-Filtering-Correlation-Id: 97374685-ad00-4cba-6e5e-08de5e72d6cc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|10070799003|366016|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?ODBXTk5yeHdmTzQvVS80dzVXbmFNbUhTb2h1eWZtemVNc3R4Q2VrYjN4K0ts?=
 =?utf-8?B?NE5BQUpHUzV6T1hpaWlaU0FueTk0Q1drd3JOTUlNYlA5Y3A0ZlgyOU0vY1RR?=
 =?utf-8?B?VnQ1enNiU1I3ZGM2OGRZMGlDeGdLRzFFK2tRUWEzVXpCeXdLM0d4ZzNMc2Jl?=
 =?utf-8?B?NFhzL0NmOFRLbmhPVVdkNi9kL1lmTExxck1qcnVmeCtWRlA0a3I2bVpSWnVU?=
 =?utf-8?B?WXpEY3ZCU1ZRa2NvZjd1YmZXSWNMbW9UV0g4T3VFaWgzS2pXWTdNdzVDd2NH?=
 =?utf-8?B?bURTYXJNUHlJb2RhZVA5YjhaUHRVZjU3RVFmODd4bHQ0cXVhT3lvWTM4bmNX?=
 =?utf-8?B?UXg0TDEvS1VseXdqVW1jTktlditxMDI3VE9DM2ZXVlUyT2FzRi9OVUlYMFlw?=
 =?utf-8?B?TElJRjg2UHBmWmxydXVYbmpzMFlBdVg3U3Yzam1ORTlVUkNTZXoxdm81dDl6?=
 =?utf-8?B?SUxjRlJrclVZSjUxdzhINkEyMU85YTJWampaTllVVlhFcmg3TEJaTVc3N0tj?=
 =?utf-8?B?RzQzdVkrVU9EWXFrd2l3ZGVMNUhhTWQrWHo3T3BmQTcyUkdsNjdEZ1kzTFV6?=
 =?utf-8?B?dDI2ckF1MS9BV1Z3eGdKSTJ4UytUR3ErT095aGZxQm41NE5RdWZtbGNwYVBy?=
 =?utf-8?B?TTFnaHM5ZVNoOEhHQlJRbXovNG91Um40K3JSdFdZT3l1b3BZTEsyRDdtK3Ar?=
 =?utf-8?B?Y2hWQmRZRzZ2N1VSK2x2djB4cDNoM1V3ZTFoL2RoT29zOEhnYUUxSGdqOS9l?=
 =?utf-8?B?ci9HVnBVUUhLYmVHU3o5WEZPcHhVNVhaL1pwbzR1VjZYUHgxSm1kbmdTMll3?=
 =?utf-8?B?ZDZFcnFBYWVVenVOcHRZcERoc1d2c2RsZnZVNWowTTZKYUJYNTVHdnZ6Qlcw?=
 =?utf-8?B?QXcyanp3Y2NRL0p6aVJReGxRUlhGOFY5b1BWLzE2cGZkRlllVTBVQnFMeXYw?=
 =?utf-8?B?ZjFyS1VHU204MThKbkxSNGtUb0VmSHRGYThDaFpSZWZtbXhyLy91VE4xY0s4?=
 =?utf-8?B?Mm5tcldPdGRTUlhlWWRMVkJXemVOcVp1UXliaGFBZWlPS0wyOFRiMXh1cWNU?=
 =?utf-8?B?cERJV1BTR2t1TWErNTkyL0FjaHN3K1VieW1obDgyRVFzaEE3enpMZ3MvZkJh?=
 =?utf-8?B?YkRYcWs0djVUNHdmT3kzT1hDWmszN0cvL2ZEemdOdTR4eHdYL05iek51aWhZ?=
 =?utf-8?B?M3pRNGZUWEJub3pyd0JoK2E3MFI5TndlT1hmR1I0RzF4NU9DNUpYY215Tkgv?=
 =?utf-8?B?WWt6aFpIbEZCN1B5dDZzdkJyTDV5K1ROdVc0UlZYYVdoMyt6bWYyb2t0bDFu?=
 =?utf-8?B?UEEwdFp3amRFVFl2Q0tzRFB4K0UwRnUxVnlLNmlPTXRCUXg4aGwzbTZlNGV2?=
 =?utf-8?B?SXhRcDNxRWhsZzFsTW94K05jSlJPVk9lbXRvbE9ubEpnZXdGQ0hUNWtQL3pZ?=
 =?utf-8?B?MnQ1a1kyNFR2N01xWnducFhGOFdqRHR2MXM5ZVhGd2M5OFR4ZUt1d0tNOHcr?=
 =?utf-8?B?SWhPVjIxOGVRbE5WaS9pc2pqcHpXblFTaE9FRjhRdHVOeGhDVW5LNHdmaW1J?=
 =?utf-8?B?dS92V0RLSmZwTCtXZVRGdHVxWDR2SnhSazdqakRMQThsS1cxd0RaWDBGcWRj?=
 =?utf-8?B?a0UrSDhZaGtLOG1pVkVWdFFCYi9jT1ljdDVVS3k0U3VKNUptczFFS0JKZFFj?=
 =?utf-8?B?SS9iK3pmOWdIeGowNExueUZsak1oS2pUSmtRQlY2OFVkYUZ0Z1RZNXNwYkpT?=
 =?utf-8?B?MU8xTjF1dFE5V0hoMW1Kd1BORUJ6L1BSbVVrZXU2azZyZ0R6N3RralhNdHEv?=
 =?utf-8?B?OG1UYnFOK05pdEZTMmkxN1dFVTI4OXhGRE9mTzcveUdvNkpTWFFqOTJMT3JY?=
 =?utf-8?B?SWNuODNaSHRkOUNDYjIvUkR2bWptOHVFczBpUFR0dnhrSjF2RWlUSENZMW03?=
 =?utf-8?B?c2dUUXdKQ1pXVUVWRnpFbnUyUHdBcmh1MjhJcWxRMUxDc0krTUJMQTFCV0JX?=
 =?utf-8?B?ZkcxS0dLSmU2L284ZHZVVHpkR2ZQcmNiWlRQODBKdzFIVW9kd2IvOFY1NktD?=
 =?utf-8?B?aWJOOUFzWHFLc2hjSlZxRG5ZK3hZa0x0c0VXWTdlNWxHbjgxWVhtaDZZTnFv?=
 =?utf-8?Q?CYtI=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB12038.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(10070799003)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?SlFYZ0pmdlprSHRDMHpoZmhaTWRMMm1YUzFpYmpWVlhFNnVnU2J3NnhlMFZv?=
 =?utf-8?B?WlZubDFodDY2RmRZbWNqVXFuUVVpMkJHZGJPMEprQVpQTnFyRE9OYmlETVFT?=
 =?utf-8?B?OCtyelQzK0NSY1hpUityN2x4WU9YK1FITEdGQVQxOHcxSVlyZ2Z4OFgrMUIw?=
 =?utf-8?B?YVJPNVAvbHl0N1lRdEthb2tCUGhkWllVL3lMT3VUS2hCZzNtZkRPY1JOcnNx?=
 =?utf-8?B?UFRtcXJRYWlkL0JtMW9WdUlVdjA4VThGUlhCSktLeVNLanFqWmJrci9uSW05?=
 =?utf-8?B?RlRxVWt2a0djdEUxUWNoRytoUjF4MHJJcllNbWhqWndRenlZSUU3VUVQMWZm?=
 =?utf-8?B?dGtEMDR5eDZxZG5tNTVybW5xTWNpbUIxVmZ3Vks1SnpJRDdUNlFObGZxZ3VN?=
 =?utf-8?B?ZWNxNCtJM29xeUFqVzBncEVwUWdQRXRObC9GbnB3aGdZaDdMa2NvMXVCK3BB?=
 =?utf-8?B?S2EveVY4Q2Y2YTJCTE9ZeFB1eUNSU1o4ZDF0UlExVWVHV05CRUlGL0tzNEJz?=
 =?utf-8?B?TGd0UGtEL2Q5QUxSSG9Xc0ZXcmVTVzFxZjBCZS9JL25pQVd0dUxMMEptblR0?=
 =?utf-8?B?bElaQWpINEkvUlVkbGlKQW9xc2YvZ3hPV21lNUtjeWMvRWR4Rmx0cDFJS2ZF?=
 =?utf-8?B?ZGlRYnZEZzhRSXFhciswdTFEa2pLUTd3RWRwUktCZ3ZEbXBvU1ZCczNtWlFW?=
 =?utf-8?B?ajZuZG9uTnFnVjBiUzEzYWgwN2c0S0FFbVFQRWlDMit4UDB0RTVERzcxQU91?=
 =?utf-8?B?U0htTlVkbmpTSTM3RGZOamx3TDUwYWRlazNTZjNjZ2VORkNlOFZvYnAyNWxl?=
 =?utf-8?B?bmY4Q2NLcVUybm9TTEpYNWNJS1R2dEwvYjdUTSt1OGFGWm41VmFSMHRnWCtD?=
 =?utf-8?B?Nk9FcXBpWGtlclRyMEo5V0ZBblNUV1RQSzJ5dTF0bEZ2S0JnUmxkaUNZV0FO?=
 =?utf-8?B?VWxxVFZmZ2FOZXFVM2YwTDRCenA0a08xSkoyeFo2VFpHWTNqRzJrOU9jV203?=
 =?utf-8?B?SVNwWVFQU1BrdjI2ZE5UeUNWOFNPU1g2WXBkL09tTXJrK3NDMXZXWTlLd2lt?=
 =?utf-8?B?dnZjVW5OdjBzcUd0aThRaithNGNrVTFjejNsRDBBOFBYMDAySG0rZlk4VFd5?=
 =?utf-8?B?alcyUWVqbjhPT0pBR1pSd2pzYmVnSEpLbllUa043RElVQXliZGM4UkEwaDVl?=
 =?utf-8?B?QVp5RUFGaVk3WXM1WlZHU1ZReXF6Y25kUlhBR0dqN0lpbzA5VXZiNHVpVWl3?=
 =?utf-8?B?UXRWb3JsdGVTMFRzOHVaNkdBSG9MLzY5MTZTbkRoWGN4SHJHZTQ5OG95OFVl?=
 =?utf-8?B?L2VhSVJzdXBRV3BDMlJWZWtCZGNZRm5jSG93ZWtxTlNaT3N5RlVKOWRhMlJk?=
 =?utf-8?B?Ni8xd3I3MHZtS2dnek1UUHRGWVZjODBFY0I4emdyN1NDK2JtblBYekhDQ3B0?=
 =?utf-8?B?VlNjSEEvYklyQlo1SVhYZWI0K0lYMjI2eXJ5RVp5eFZicDMzUXRON1IxTGVY?=
 =?utf-8?B?Z0s4REJCWlh1OThjd3RFRTZNeFhZczRkVVpyc0pVQUMwMFduWWc2QTA1ZlFR?=
 =?utf-8?B?OUJ3VnNEcWM0WDdBUlhUSFBtYkdINWJlTXhMK1gyNnJMbWFSYTRiSjNLQytR?=
 =?utf-8?B?Z1JyeXpyYW02emNmdithSVZYNEphK3dZZ3RKdjNUcEZvYzdJd05FV2MxUWdN?=
 =?utf-8?B?RHhqL3p1STByN3VIN0dWUk1PdE1EUWZtT3dnaFJjQm5wVlBGVW9XdzloaW1S?=
 =?utf-8?B?NlBCS3lvWUU1YXpJYkJhdzRwUVR1S3QrR1dkNUg0NXhuejNtdlVpM0h0L1Zw?=
 =?utf-8?B?RnV6a1NxaHVGRDZnbi9LQTBVWjFQaGwzUXZ6R1J0SU8yRGFuL2RQRmthUFl5?=
 =?utf-8?B?OTYrV09RQmVvRzVPcHF0MUFpRVdjZHhRVnlXRm9RRVFtYkh3VnhzdS9FYU9D?=
 =?utf-8?B?Z1hRMyswYWxTNFJmdlpEaG9tZER6WmlMTmRtRlZlRnJGVDdGMDJoNHNGWmM5?=
 =?utf-8?B?cXBZY0lSSTZWakdYaFoyWFhJT0VUcFlaY1R1d1p6cW9Qc3FEWDVvMFlSSjQv?=
 =?utf-8?B?WlR4VGdNK3AyK0hndG9yOUZkSi9TUkFDUFZRY3J2dWtDNzIwa2JndXdab1Iy?=
 =?utf-8?B?eFNqSEZ1TEhQZHlMYm5FTDZ3eHRFL2xxUXV6OTVvUTFNRzB5STJ6bUgvSjMw?=
 =?utf-8?B?NlFacXRLNXB2ekRuMXVKZmNidTFjZTlBWThPbFB6UTY1WHFIWnI5dVJFYk5T?=
 =?utf-8?B?VndTRU5kRG84SWcxTmZVSmptem1yVzh0SHJydlRleUZuSHc2a1ljQUlPclJQ?=
 =?utf-8?B?MUY2UXBIRVJ0ckZTUHJhR2tGdXJQM0YxTjhhaVU1eXdXb0xXY3BxaHFaTFNq?=
 =?utf-8?Q?u5tWtYf3esIw3FXH2Y5vSRGcgSS7MfbsL8Z3Q?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 97374685-ad00-4cba-6e5e-08de5e72d6cc
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB12038.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jan 2026 13:40:45.7766
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: einBormgEKZOc40fHla6PEWGIq+OTqjtOK7wFOEcoglXtRf4gW9r4aBqq0ByRGnU3SDcJ7KeKd48VWMqF7vbG5bvytw6GhD+sX+/j6GHhBk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB10658
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 28 Jan 2026 13:41:03 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8761

Hi Antonin,

On 1/27/26 9:19 AM, Antonin Godard via lists.yoctoproject.org wrote:
> Refresh the document now that the Poky repository is obsolete.
> 

Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>

Thanks!
Quentin

