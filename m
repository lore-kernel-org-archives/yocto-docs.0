Return-Path: <quentin.schulz@theobroma-systems.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9436C5478C
	for <webhook@archiver.kernel.org>; Mon,  4 Mar 2024 14:19:09 +0000 (UTC)
Received: from EUR03-DBA-obe.outbound.protection.outlook.com (EUR03-DBA-obe.outbound.protection.outlook.com [40.107.104.116])
 by mx.groups.io with SMTP id smtpd.web10.99636.1709561939376594039
 for <docs@lists.yoctoproject.org>;
 Mon, 04 Mar 2024 06:18:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@theobroma-systems.com header.s=selector1 header.b=CMQsW58Y;
 spf=pass (domain: theobroma-systems.com, ip: 40.107.104.116, mailfrom: quentin.schulz@theobroma-systems.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PBCOVU5AHTscGs9+PAbnyh87fNLMv7Tdc7WFSJFPmMIi2P8+6QQjQItUVH9/i3DMQLzQFamvA/eRlvoaBiQaS/nu+3uJqe2Kxto0r99DEPApbW5r5EEQ7f8L+8CAr/q63xaWW+nFlI75Y+i8CZL38cXJ7+Rf3yWASG29amaXphsEOmc8vZvX3aet+3XRnd5ALG827jAbavvecis5WYD6u+iO8YEFjCWfn4Sqz6UmOwb0Us0u2Z1o52o0SXtjq8Us0oqQ7zKneL6sPRDOm0BbGZbfdaO9cQ+DtTlWYfuOz/wqqVZrMK1oQPRxkQbsYkw/edcVwUYVLv9XsMHmx3h2Nw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xMjReyoKZo4HBAGGfcV5IphgfwLbo+g0m1A/0B5L7qU=;
 b=MjRduOTyjUzJGDPhaa8+PlcL2mfcMlRcejB8u099KUjMrc7cUCRDAWE/IEpAL4CI5ZbLllivRYvQPDf1fYFrOBMeVYBjlM/rcA1ZDFX/zfbRwYRDqSZmJJPNVCUimbNyU79XabhBDuAgDWBYLdYf21R1kGut7HD8KUbwICOTHNF53SjbEXXRAVFz0x6/3siJHA7UQQbXCyRFdKibOhEqxgIWiYHyeCAxCWzSRDi8QmsmKmKCI8v7CoBt3zLDZvDH3ZRFuKMuMnGTIPYTaURCdEt1T6/qyoI6GWbgR40Er2k3cKotVHoIkTtSv1EFzS9kzLoZlYizSLComJKhIYpg1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=theobroma-systems.com; dmarc=pass action=none
 header.from=theobroma-systems.com; dkim=pass header.d=theobroma-systems.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=theobroma-systems.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xMjReyoKZo4HBAGGfcV5IphgfwLbo+g0m1A/0B5L7qU=;
 b=CMQsW58Y0Gv6/+SaSsuw2AElsICcC+5L2pjhw7EQcAGX1LAA2Iwzn5p3Y+2V/F3QeXSm2uFabDUZLJ5TWgQAUkpOlKcVwf7lix5kuA4pK4pJelUgoWmlu9bjxs84mTDW1GgtuHtcISu73WoEJWIn9EJBHxH4EdWe4eBxsi/sYlx0wPL/kT+gyibEWPPM1KD9+OGjZnf8ArQagcPqE76A6DQDwJw1ZJjAo//fPqE7KHoklL+31R4Q0Mp7ThBmTJVBUM6cqoN+kmSoYCxVocQs+brqxNqgZ/3sErbS9cE0+vXAWrnEkE6+qPzNDFOO5/iJPrI0m79kdgkQQb4nwJXXjw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=theobroma-systems.com;
Received: from DU2PR04MB8536.eurprd04.prod.outlook.com (2603:10a6:10:2d7::10)
 by AM9PR04MB7572.eurprd04.prod.outlook.com (2603:10a6:20b:2d4::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7339.39; Mon, 4 Mar
 2024 14:18:56 +0000
Received: from DU2PR04MB8536.eurprd04.prod.outlook.com
 ([fe80::23:4118:ae4a:8dda]) by DU2PR04MB8536.eurprd04.prod.outlook.com
 ([fe80::23:4118:ae4a:8dda%5]) with mapi id 15.20.7339.033; Mon, 4 Mar 2024
 14:18:55 +0000
Message-ID: <0db2bfda-8c12-423f-b22f-e1cb2ac9d73d@theobroma-systems.com>
Date: Mon, 4 Mar 2024 15:18:53 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dev-manual: packages: fix capitalization
Content-Language: en-US
To: michael.opdenacker@bootlin.com, docs@lists.yoctoproject.org
References: <20240304141301.132063-1-michael.opdenacker@bootlin.com>
From: Quentin Schulz <quentin.schulz@theobroma-systems.com>
In-Reply-To: <20240304141301.132063-1-michael.opdenacker@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: ZR0P278CA0084.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:22::17) To DU2PR04MB8536.eurprd04.prod.outlook.com
 (2603:10a6:10:2d7::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8536:EE_|AM9PR04MB7572:EE_
X-MS-Office365-Filtering-Correlation-Id: 28750f76-eacb-4f5d-61aa-08dc3c56069e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	KYjl5y78GlvSVZdhrlSpMjSrhrPlvklUVgB7I1ORA+w+NJvDTl7Vbql0H30NvYtciZfujmRaEKcWvaSl/Yw8/lV2jsso59vOmyFS7tXsQN8qRr8INxEXt0qaQie+dDp5jS1R1msbAzEyE0qTBpnE0GsNwGytuAG3uZvYutJC1DneiTwwpQo8bem9WtM8I1/e1iyuIiwZMhRIjj0ExR1jh3520CJaEPVe1RPKcJzg6SsHjjJefwNh6qXRF8r6PcrVCJG7eKoy7B53zmWoE/eS9PyZOPCSLxseR4vkIZpRUSJEsE3bo54Zx5vSG2cENeLxRcVjnO+gyRq2QfMPSjANV9EkcSef7xCFRToWgyIw7TlJbxzfOpENh7r0PcL9/UJLx5D01MY+k5cdX3VNDrWsTpm+/gzxQkntIzb2Aazt28QTpv4RQa4d1ch7RpIW3Op5TGBK94zCSs5rfsbYEL2rBY+sP59pz30rnzZRM3BLp/hL47Y+IE0KBn/9z426eTANKxwehvSQhsXz/Fa83LMurz6pEUh8b2JKkpIFz+CqddI8itsagxaA0tcyEE8BJE+K3vw2qO9tpQi8cG23mBLpr2Er0JdKt153gyy76fQ+SdHh9dBEP9fYM3wHu2T1iq7b4zQenu8OqMrUrMrOy1+X5mdJr1SzVZzk25L1WB/Fgh0=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8536.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?STAzRUhYeElrQVZkMGY5QlhXUzNiVWIvZDE3bDlZUkFkVm5uSnUwekM4dSt0?=
 =?utf-8?B?OG9YVTFWVmtOL01nS3hoazdVT0p5VDBtT3Q1NUoyUTlMTzRnS0dQaml6Vy96?=
 =?utf-8?B?SGpmR1J5WXkvbS9sUEVJczFKVEM0Z1hYVWNuMStOdmxqMnh0NHJjMmg0SExD?=
 =?utf-8?B?SjVPTkkvWUVrQ2FWME5ISDNYUDVNWFFjVGdsdWMvUnlTalcvTjdMV2ZTOVhO?=
 =?utf-8?B?OUlhWU1qTEhFRUJrLzNwR0hLa015OEtzSjd1QUJ2czBkNk5vYmcwY1pXak5P?=
 =?utf-8?B?cE0vSW02bzFscEYybXZqTEJDRFRzYlIweXpJY1p1TU80V3M5VXNUek5xK3Zl?=
 =?utf-8?B?MEhwWkx2K3U5TnI1eUF3QXR5NjcwVVlRS0VRWThjTDZnZGZUMk4xbXg2c0dR?=
 =?utf-8?B?UkNEUEczN2JWajg3aTF4MUIxY3Yrb21vclo3OCtIeVVZNVVOZlFjRCtHZU80?=
 =?utf-8?B?ejkrRTVWQUJEQkI5dGZBREE2ZGlYbGh2bi9XYmJBTkFZV3dhdEFuYlJOU2pY?=
 =?utf-8?B?S0hlZGR4eE1LSUtxdVRlTEFOcVRWNzVIWjAvaFRQVmdSTWRLNUhnVWcvZnZi?=
 =?utf-8?B?NjNGVmhHRHdnbGhyK3BaNHd0bmRJUXpaZEtZMEVNTitrK3dyK1F2Rm1YUnln?=
 =?utf-8?B?NUNJNy93cWU5YzlHcUJ6WmdjbDJaQlRzdDdSS2taK2tjcmsxNEtVQ05MMDJJ?=
 =?utf-8?B?VERCd0p2MEMxTnBLU21Id0NTbnZpbmNYK0ZHc1ZnZmp0Mkh6UG52RGM2U0t5?=
 =?utf-8?B?S2Jzb3ozOVR0MWpGeTJVVWhncVJKWnc1ZmZ5TzhydE1pcVVIUzBSallIbEZa?=
 =?utf-8?B?SVQyU0ZxdllhMmtDS0dtbmxzaStuRjFvNzl5NjFVSXNPVVlKQWFISFJZczBL?=
 =?utf-8?B?bVpsZDR0cmtNRDR2aUxTRWNBN2s2S05EaGJLc1VkcXB2ZVJobTlLSTVHdDBn?=
 =?utf-8?B?L3FiaWllT0RBMFNzakpGOUt2d2xNcTJta3VvQlAzQ011ZkhiM3U1SW4rSjRl?=
 =?utf-8?B?Nm9BRUtmei8vRkRacnNNT3BLVlJuQTJyTzBXQS9TL1A2eVBkNkRhQ1RJQXR3?=
 =?utf-8?B?TzU2K3hhM2c2c1FacDdWNDh1bHJUZld5TFRXNFdXYWRCVHRvZXp1TjYrT2FF?=
 =?utf-8?B?N01jNStpaEhlR1NtVGRHR3R1MzJBYm85OXY4blZtT0ZUdUZiUWpETENaT3pJ?=
 =?utf-8?B?YnlNc0xBa0xGZ2NTSlRJc1FsUzJINGszSWN0Zlc0dHRaVEZRdjdxQWVpSXRI?=
 =?utf-8?B?alZzZVd6ZnphcERZZDV3Mm5qOGwxcEVIVlBUQlI1d1VMNW1sR0dYOUdUZDNa?=
 =?utf-8?B?Z2ZLQnpkMkNKLzk3cnFYaEIrU21RSkNFSDkwdkhXVWIyWEh1dE93M1grSDZQ?=
 =?utf-8?B?VDdDU3FmZ2tDdWRQUkRpNkxFdi81d1gya0l5NW1hcnBmdlhQS1IwWll0T0FM?=
 =?utf-8?B?QmJyTEFsSUFHZVFNdmY2ZE9lS1FwdHdSdFJ0T29Jb283ckk3Z2YwUmdHUk04?=
 =?utf-8?B?VXRHeFBGcjRsVHJqUnhVa2toZHNQbWhWQ2hjOVJ0RmdEUzRTWXdFbHJ2TU52?=
 =?utf-8?B?K25memFxRUZVcDhvd29RMFJ6Y3NaRGpTZlZUSEoyb3VOYTJOOGdhbEc1RjRG?=
 =?utf-8?B?Y21UK2NqbzltYTVMYis5eE9sU1VkZWdUS0N4M3l5T1FpL0VRVURDRVZKNVhm?=
 =?utf-8?B?U1dxbE5naGNrSXd3TUwxUW1ROGpraFhuREdvdUFsYXFSNVl0bVJCeDVlT0g3?=
 =?utf-8?B?V3dGTTJLU1E5Y0RBTlFMYy9KSXN6dkFrV2cxTG5RYzlodU9sOEpVam1lZ3pp?=
 =?utf-8?B?amR4dGRjSGUwdmppOWh6VGUrdm5yeXlKQWFCTFNZR2RFTkc0Kzl4NlVrUGoy?=
 =?utf-8?B?MEhWUmlVUnRQbjcwbDMzakdlTG55MXJzVmVOYUxJZnBjV2I2cGJzZXJuNTVq?=
 =?utf-8?B?WGdwVENmRnVzVWl1ZEVyWHI4MEx0SzhDU0t4QTdxNU0vT2tiNlF1VS9oMXlm?=
 =?utf-8?B?bXVJVzNnU09pZkF1OGtiOG9ZSTNUZHdiV05qZWlVSFhLZ1VDM29TK090bmdX?=
 =?utf-8?B?cEhYSzd3VTZwS2d1ZXc0dHVHTnJXWEJDd0tBMHlDdmp4dmg2Sjk4UUdtQWMy?=
 =?utf-8?B?MTRQTG1mbjJ1anQzTlpzOFdWZyt2VzZ4YnRYOEhzQ3hMcVc4SE5FSFhEcTNR?=
 =?utf-8?Q?IWZzsOXL3eyBy67mB8vntM8=3D?=
X-OriginatorOrg: theobroma-systems.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 28750f76-eacb-4f5d-61aa-08dc3c56069e
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8536.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2024 14:18:55.8104
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8bwAU5KmzR7QjKAYcMay7SDxNG6TRZsTuMBIWfmE/NSuVvgHT+ZqWETAKva6RU51CYRHDQ7wjWAsgiHrHOSJUtbP04zn5+7WkjKloda+VkUu/a1VyyXJuIaLfMnvRbWj
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB7572
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 04 Mar 2024 14:19:09 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4926

Hi Michael,

On 3/4/24 15:13, michael.opdenacker@bootlin.com wrote:
> From: Michael Opdenacker <michael.opdenacker@bootlin.com>
> 
> Using "PR service" instead of "PR Service", like in the other
> two instances in this document.
> 
> Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
> Reported-by: Quentin Schulz <quentin.schulz@theobroma-systems.com>

Reviewed-by: Quentin Schulz <quentin.schulz@theobroma-systems.com>

Thanks,
Quentin

