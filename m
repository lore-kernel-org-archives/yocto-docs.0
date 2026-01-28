Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 141CDD25B42
	for <webhook@archiver.kernel.org>; Wed, 28 Jan 2026 11:12:32 +0000 (UTC)
Received: from DUZPR83CU001.outbound.protection.outlook.com (DUZPR83CU001.outbound.protection.outlook.com [52.101.66.17])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.10696.1769598745095866968
 for <docs@lists.yoctoproject.org>;
 Wed, 28 Jan 2026 03:12:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=KAC0tEU6;
 spf=pass (domain: cherry.de, ip: 52.101.66.17, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hup/uW/Lr7GvmB1mIyIp0kvm7ZMZ9a9vDWkfpv49ueo/reJm+DT3P7h97ikQitv0bAPJzn8SRNSMbTwpBEWxEi6Mwlf379yXMob47KPOVBc5ylFHEOr4XToFaHg9O/Ll7Ts5WKI51CLSUCAp/CesxQOjbsZX97ltWzafQQiDbHYSpPdCg6AOpqoEU8BIe2p3FbnIuzpxFUvgKcncIgUrg0/8nJu/U/ezJx0NHFglqK28p79daOclUDZJfCOg5wiGkWoMj/hLfCaHX4v9k8yGHpY+lIK/Zskw+1nqV3O2kuoXQ36Won0jDDcUIEcim3RYLLLKSBAEaHstctiV73QKjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yaS+DfYx/ITsJBwbJd8GLcd0greVLqWOUML+xKLc7zw=;
 b=yBkWsssslvrexrDaxOuuemaHgJPSjOt4+qlsVvMHHYUCqYxma7xtK2+3bjA64GQQx2x+tPjHff6BwiHXuPXAxRqRU+6A15v4A3O2gnOMF5qn2jHOZ6xON0WVfJbrC/wfg5lTRgY7KYB5APgkoF7DX15FwboiR+NhEEYugDR0qH2RBC+szkP/RimGHY6L4KGBnMc9Fq6LbAVr8itwFlltc3rKsDW4AWAC8QFtSoOqK4cwckm9+T1O4Iyq1cHAoaJ5tWW2DIJ6XUsD9QXWCVNIg0FqyUDatFuQksYLXPeUKiQFBGngdFsvLVrJF7WM6+mdGKIe6gffR3hlL6sv4iGVww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yaS+DfYx/ITsJBwbJd8GLcd0greVLqWOUML+xKLc7zw=;
 b=KAC0tEU6yXSEVxP2pY85p/9vbCAdY8mL5WvAl6mw1jFXqcV5HxhTk2s+7kxrESo5AJoKjhtFeUJCmn7mT12AR7zX6eow58FW6bNkDzi9Q2PCgZCLblFEe066VMps5VlzaVHwn12XChXJXu91+kJ1SpcNpOt3Gx+QSHKg6RhKr/Y=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com (2603:10a6:150:2be::5)
 by GV1PR04MB10193.eurprd04.prod.outlook.com (2603:10a6:150:1a4::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.14; Wed, 28 Jan
 2026 11:12:19 +0000
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::6c04:8947:f2f0:5e78]) by GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::6c04:8947:f2f0:5e78%6]) with mapi id 15.20.9564.006; Wed, 28 Jan 2026
 11:12:19 +0000
Message-ID: <a16f5edc-d51a-4efb-a7b7-3d81092df3fc@cherry.de>
Date: Wed, 28 Jan 2026 12:11:16 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH v2 22/56]
 overview-manual/development-environment.rst: remove obsolete poky repo
 references
To: antonin.godard@bootlin.com, docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20260127-remove-poky-references-v2-0-74bf80cc4e5a@bootlin.com>
 <20260127-remove-poky-references-v2-22-74bf80cc4e5a@bootlin.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20260127-remove-poky-references-v2-22-74bf80cc4e5a@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0057.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:49::14) To GVXPR04MB12038.eurprd04.prod.outlook.com
 (2603:10a6:150:2be::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR04MB12038:EE_|GV1PR04MB10193:EE_
X-MS-Office365-Filtering-Correlation-Id: e87e66d4-6c66-484d-36b4-08de5e5e1a62
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|10070799003|366016|376014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?eUNYQWhtNVhiUHBiV1d5WDNOdDlNZTFpUzI3VDhOeWp3aEJreVpRQXJrU1FK?=
 =?utf-8?B?ZDl1S1p6dXJQa21IditCUmQvUEl6Y2RiTnN2bHN2bzZLbmtuY1laWUFtdVdy?=
 =?utf-8?B?Q3g4UGNlanFnMVJiK0FEQWtubmJ6MWxiaGp2V3VQMWdSRGZ6YkFHL1lxMktS?=
 =?utf-8?B?Vm9KN2E3U29iVVVJL3RDbkJRUzFjQ2lvNXZoaXRDcVRoTm5lZ2tJNHpFWVNL?=
 =?utf-8?B?RHZLUGJDdUlKUVNOdloxVXRlelh1bDhHVzZUKzhrU21FRWdsYUI1Q3luY0Zk?=
 =?utf-8?B?blk0YU5ZYTZieXJGNXByS2QwbHhFNlFGTnY2L1hOVDEwZXdpWndOQlU2STg5?=
 =?utf-8?B?QjJSV2d4UGNIUVV6SlhadGFqRFlNSkZyMklsclZWQlBTRmxyL0RVMDMvcm5a?=
 =?utf-8?B?TkZxQlRCcktaRGIycXFLelljeVRGZ0s2Z0wzRi96RHdpK0lqSFBYSS85cjJX?=
 =?utf-8?B?eHBZczZTaDZTZHpkMWZNTXBlemV2VWN2WGh6aDE0MHJrLy84Y3c1cWQvY1Rm?=
 =?utf-8?B?TEFReDB6M1R3dmljd3hWTXZPVmZVaHgzQU9nQzdEUFhPWnJEOEpJYmo0NExG?=
 =?utf-8?B?aTdvVCtXdG94L1JBWG93cWZpdFgvZ3FGNGl2dktSVmUrN2lrWmRONWJuVW5i?=
 =?utf-8?B?aUdMTGgzVmlHZFgvVit2Yi9jL1ROUzhFK0xCSzdqbDU3OVBjYlBwMlFuemxK?=
 =?utf-8?B?bE14Uk9lTTRIYmRLK3VEVjM5aE1CTmVEK2JSTlhnS0YzcTUwY25qZjA4UDkw?=
 =?utf-8?B?SmdZVmJqbGwycEhsS2VhQkR3aXhwRWlUc0lQSnZvMVArM3JvODZDRXlEeTdS?=
 =?utf-8?B?aTB0b0IzRXVJbXdLN2tSWS94N1plTStZby9EZGFDRE5kMnQvVzVvYjJjaWdn?=
 =?utf-8?B?K1lkYnlhUXFDaDAxdmtHTU82OWdRZGlBeDE1aFIwTGVoNFZWOUxjeFV2MFVG?=
 =?utf-8?B?T2Jkc1JBdkUrMWVBWFZHeDhVeXNpN1FVUFpjRXdZOTV0UXJKYkJBQ01vR2NQ?=
 =?utf-8?B?QW9IWlZjZ0tyZXlEQ3BpR25FeG9vYjRBUFhFU0MyM2Y5eG9LK2YxdWJBR3ll?=
 =?utf-8?B?b2picDV6YUVmM0tpWk5LMWRRcFpXQXN0c1NpWUVDemZ6M2RWYVNraHRZa3F5?=
 =?utf-8?B?UzNLUVRQUnVTd1Y5NHN6MzlZQytQSXFoT0JJMXdLSFZHQXJma2U0ZDVrYXBo?=
 =?utf-8?B?MjhxRm5tVnRvUWF1bEFPRkppQ3dYaHpnQnhVYmdGc1ZqekhJeGhRcG1rTUxC?=
 =?utf-8?B?dk9ockpJNXAzaFNTYmduK2x2UzBLMXAzWW5udVJvdjVIRkVJdHZBa0p5dGlG?=
 =?utf-8?B?WTZQWGNtOWI4WnRwZmNKbXJHVkpvcmNSSnhpZENIOUhFd3FHTjZsaDcrcUNx?=
 =?utf-8?B?TndEUFVNb3ppQ0haM0FyTUpyejJmemZHb0RrYzI3RktJUXdXM0ZWS1ZUaWkw?=
 =?utf-8?B?RUpCaHRNTzhwRGFtY2hldTU1MDYxbEVldUhUSXZXWEt5eG1nVmY3dHFWSFE2?=
 =?utf-8?B?Qjd3N2g5enNaRDVCWHMrbzhhUWZHVVFMK2dCWUVISTMxOXlrbzR6c1BoRkl1?=
 =?utf-8?B?SStUbHNCNUY0d2lHZW1Ca3ZOQTIzYS9jcW85NjZUbXlZZnVEdDZZckUrTDNo?=
 =?utf-8?B?bElNZDN1a2tVZ051OE03dVZNZ1hKcHBvSTExNzJ3K3NiRml0Qm14SzNKTjRw?=
 =?utf-8?B?QlZkL2dZSWdnTDMyazBsaCtYZDRReHo4RkdsOGN2ZmZpdDI4Z0hWQ1FIV0Vm?=
 =?utf-8?B?SUthMVUyNTdCNk0rbXlRd1lQYXJ4eW5uYkdyQUx6YTI4ZUhRUkIrRWQ3OGVa?=
 =?utf-8?B?YStDbVJyL3p3MzBsczZFdGVodFc2UHlhRXZpT3lIN1N0cmh1TU9MTUdwVzVD?=
 =?utf-8?B?UHZMZnNQOFk1bHV6V3MvVzdCWXpHdEtHdDhLZkw3cGZFZm1QWVlENnZ2N2dy?=
 =?utf-8?B?ODZ5K3hNS2Q3cjQ0VE5xN3A3Y2cxeW5OVU5DY21oNWVxeGFQeVFVdE5IYTE3?=
 =?utf-8?B?eU9NR0dmZFlVN1cvYVNlbFBOVFFHLy91ZXlIS2RvMkg0RXNTRkhTbFN4MHZH?=
 =?utf-8?B?L012Wnh6ck5zTnVzU1NUeEt6QWdqZVd1bzVCNElLcFJxV2I4aHVFRlpqb3dz?=
 =?utf-8?Q?SRW8=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB12038.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(366016)(376014)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?em1Mbk00V0xLanpqa3AzNUFjVGd0WS9NQmhReCttMjJqODdjZ0xDOFNsd2sz?=
 =?utf-8?B?OWFYbkM1YjlWbk1IeFJYMHFjanlqbXZSaVZqMEFZalhSb29YZ2xhOFlocDI1?=
 =?utf-8?B?TEN3WGNmbFRDemZBUWdkS3hJVEcwYXNraDM4MkVuZDNRZ1p3ZUdidTRzMHBa?=
 =?utf-8?B?U3lHNU9vNUtEUCtqK0dCRUhocUlhYnliVGJ0aG5IbjJ0TklURDB2QXM0a1Vv?=
 =?utf-8?B?UWl5UGxPTTNxekN4cFhaQVoyaWNtUUtZczdEQ1FqQXl2aEdyVktEanlKSXFn?=
 =?utf-8?B?ZUpqODdFTTlxWk1DZEFRMFVyQ3loRTZKSXd6Z2tqSzQ5dGdMK0E1bmNkS1BD?=
 =?utf-8?B?cWo4YzFmNktCaUl6S0o2MHVqd2lSUkRncTdEVk9hVHJuc1gvaXh2QUhDdklD?=
 =?utf-8?B?ZG9RM3FNTmhqenFmOFA0NzhxOHg3UzBNc2ZpcjBIWGx3c0NHZFV4WC9VdkpU?=
 =?utf-8?B?ODVZTHFib1VOeW9XTmdKQ1VZeHdMV0lWTUdGMVlsSkIzdzlPU29oTVhRQm9T?=
 =?utf-8?B?K3o3b1dqaFZxL1RIQ1JFc29PU0pnMi9XOTNFbjNRR3p2NmlhRUhzdWlrYmpp?=
 =?utf-8?B?UHJ2aUI0ZXRNSngyR1g3ZUpYTjVNK3NPdEpxbGMvM0t1MVlvQ2Q4TkhqdmIz?=
 =?utf-8?B?Qm8veC9kM0I2dGpsK1NDTUIvWUV4cWRqK1lwYVZpOEgxREp1d3BPSHNrbE84?=
 =?utf-8?B?MEZPK0l3RVBoY3ZaWUpsRjZXbWNqTGtWUytnNEVORWhZdWNEVjY0aHQya2dQ?=
 =?utf-8?B?NHpnVW9kL0kzV1FUeWVpa0FSMUNzQm54V0plMzdEcjVrdURZNFErSzJ5YUpw?=
 =?utf-8?B?MjA3ODVUZjFPQVBENjNLTy95RXRWVkpCQ1lWL00zVlExVWxMUE8wbDd3aTZ0?=
 =?utf-8?B?N2pzT0tSUFoxeWxLTEhpaGJ2eDZ3T1llSzg3ZUV2Njg1V0huWktzSWdoc1RR?=
 =?utf-8?B?SUtsN1llQlQxa1Q2MGMzemE4TnlSazlDRjFhSElISWkxQ3IwdEpnbnpheXF4?=
 =?utf-8?B?MmVCbWRHZzl0YmJuVmhTc3FRMThXN3B3Z1ZVVFpCVGlGUk1MRWN4L0hRd3ZK?=
 =?utf-8?B?YkxVVlpLZVFEdGFJbFFnYndGWndyVTZmN0hMM1htUktic1Y2TVdFVk94QVJZ?=
 =?utf-8?B?NmM1eGhyRXJRcnNydDRseEpOWVE4Q1ZCeGJleHdCYUNya3VxcldnZHM0NFRE?=
 =?utf-8?B?TXpSeWljZFpyVUd4bHFuSktUNGxnUE9nV0JOQWhvUXpmdml5aXk3RjBESVlq?=
 =?utf-8?B?a1lSVEJMMmo3RGVYUnkzcnEzRWhEbUl0eXFxaFQxb09oOU14aGF3MDl5Zkhr?=
 =?utf-8?B?eWpHbGNOR0lFZERGM1hKLzEzUkZkWXlTdTEwMERnMEt2a0l6Y2dUN0R3QStt?=
 =?utf-8?B?VmdBMzkxSE9OeS9aOXp4RkpDR0JRbUg1b0tqTHNzYWdabVBFSk1QYXlCWURv?=
 =?utf-8?B?Q2R2cWlYY3U1RmZOZjBBZ0R3VkZtaGZNeXlYQlhzMjR0YzhoWE5RYndDMDVC?=
 =?utf-8?B?eHNmV1N3NnRma2hzZ3Znd0I4OTRIMGFwTCtsNTlobi9pUzV0SHN1YS9FMTRy?=
 =?utf-8?B?Ky9TQXAvajhPUmFNeE9SaXNvNkc1RlJBRTBrMEhDREc2NVdPNzlzV2psSWd3?=
 =?utf-8?B?WVJrRnhJRlRzSVV6bHp2N29RckhlTklJYlJsM0pVVkFVazV0eGg0aXdjcHZO?=
 =?utf-8?B?TWl1eUVtR2ZGR2dIS2pkQ081bHdJMUNyWkRBUmQvdWRMMFA1UHN6ODlmd3Zl?=
 =?utf-8?B?OHpOY0QzMEdRSjVZdFRKOW90UVRIRjkxMnpMN21Wc1E0L0IzR2p6QnhiRkpM?=
 =?utf-8?B?UVhkSjUxTTUvZkRxaStoUFZya0laeUw4ZUxRa2VkT3F6TFdnK2dqTlNmaHEy?=
 =?utf-8?B?dHlNVCtORWgzY0xMVXVmbkY1YXMvWlYrK1drNjFnVE9XSW5ZUTZLYm5McWhw?=
 =?utf-8?B?OWpDMHAyWExaNis3RzRJRksweHZXU004VS9UUnNBSWpEd1ZvRDFDa0tGZTAz?=
 =?utf-8?B?dkUzWmxPckpTMlNKaVJteTdmT2xWYjRKZXAxcmtHVmhMaUljVnNpRlFVVnRt?=
 =?utf-8?B?WjFWTGtzLys2dWZnMXhXRGdSZkVodTlENUwzcEVMYVg0aWRyK1lmcVBCcnpJ?=
 =?utf-8?B?ZHZReVJsa002L3lVU3d0OEZJakVCTEhtNHVzaU5MdENBN1Uzd3FhUTh2dDBY?=
 =?utf-8?B?cEVSNDg5TkFjZENaSlovWkFxdVBFZ2pybXdZdXZHNXQ3aDAxdXFEalNZelpo?=
 =?utf-8?B?SERwaUM2MW4vWUg4R3pHSGpTSTZzZEhhVStHZnZzRms1WDdjRTIxRVZEVmVU?=
 =?utf-8?B?YUU3aXFUd3ZoOUNITjBTanhqNnFCdEg5SVlRY0YvM2oxc1c0cWptUTdxN01N?=
 =?utf-8?Q?wcC4dQKNwD/Dd42uvstaXaRPV+EMdCvH7uuYV?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: e87e66d4-6c66-484d-36b4-08de5e5e1a62
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB12038.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jan 2026 11:12:19.6756
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: O/kqzshiS3PP0VC1+DBb1wFNq3zz7qbYB92xTPk3hBSNuEEV7RXXT0qjn76BgwQvUEuv98zGvqvr/x8VRH6sSzK1HUcx3PzcqjaqFxyIRCM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB10193
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 28 Jan 2026 11:12:32 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8756

Hi Antonin,

On 1/27/26 9:19 AM, Antonin Godard via lists.yoctoproject.org wrote:
> Remove references to the Poky repository, replace by OpenEmbedded-Core.
> Replace the poky examples for the Git section by yocto-docs.
> 
> Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
> ---
>   .../overview-manual/development-environment.rst    | 83 +++++++++++-----------
>   1 file changed, 41 insertions(+), 42 deletions(-)
> 
> diff --git a/documentation/overview-manual/development-environment.rst b/documentation/overview-manual/development-environment.rst
> index ab9bd084c..0402e3456 100644
> --- a/documentation/overview-manual/development-environment.rst
> +++ b/documentation/overview-manual/development-environment.rst
> @@ -148,44 +148,42 @@ code browser is organized into categories by function such as IDE
>   Plugins, Matchbox, Poky, Yocto Linux Kernel, and so forth. From the
>   interface, you can click on any particular item in the "Name" column and
>   see the URL at the bottom of the page that you need to clone a Git
> -repository for that particular item. Having a local Git repository of
> -the :term:`Source Directory`, which
> -is usually named "poky", allows you to make changes, contribute to the
> +repository for that particular item. Having a local Git clone of
> +these repositories allows you to make changes, contribute to the
>   history, and ultimately enhance the Yocto Project's tools, Board Support
>   Packages, and so forth.
>   
>   For any supported release of Yocto Project, you can also go to the
> -:yocto_home:`Yocto Project Website <>` and select the "DOWNLOADS"
> -item from the "SOFTWARE" menu and get a released tarball of the ``poky``
> -repository, any supported BSP tarball, or Yocto Project tools. Unpacking
> +:yocto_home:`Yocto Project Website <>` and select the "RELEASES"
> +item from the "DEVELOPMENT" menu and get a released tarball of the

Why making it harder to maintain by telling the user where to click 
instead of just providing a direct link which we can check with 
linkcheck if we want to?

s/RELEASES/Releases/

s/DEVELOPMENT/Development/

[...]

> --  :yocto_home:`DOWNLOADS page </software-overview/downloads/>`:
> -   The :yocto_home:`Yocto Project website <>` includes a "DOWNLOADS" page accessible
> +-  :yocto_home:`RELEASES page </development/releases/>`:
> +   The :yocto_home:`Yocto Project website <>` includes a "RELEASES" page accessible
>      through the "SOFTWARE" menu that allows you to download any Yocto

through the "Development" menu.

Also, they all are capitalized but not uppercase, i.e. Releases and not 
RELEASES.

>      Project release, tool, and Board Support Package (BSP) in tarball
>      form. The hyperlinks point to the tarballs under
> @@ -230,11 +228,11 @@ and so forth.
>      ":doc:`/contributor-guide/identify-component`"
>      section of the Yocto Project and OpenEmbedded Contributor Guide.
>   
> -The Yocto Project ``poky`` Git repository also has an upstream
> -contribution Git repository named ``poky-contrib``. You can see all the
> +The Yocto Project Git repositories may also have upstream
> +contribution Git repositories suffixed with ``-contrib``. You can see all the
>   branches in this repository using the web interface of the

Reported in v1:

You mention there can be multiple repositories but here you say "this
repository" which is confusing. Maybe use one of the contrib git repos
as example.

[...]

> @@ -449,19 +446,19 @@ The most common use is to checkout a working branch that matches a
>   specific Yocto Project release. Here is an example::
>   
>      $ cd ~
> -   $ git clone git://git.yoctoproject.org/poky
> -   $ cd poky
> +   $ git clone git://git.yoctoproject.org/yocto-docs
> +   $ cd yocto-docs
>      $ git fetch --tags
> -   $ git checkout tags/rocko-18.0.0 -b my_rocko-18.0.0
> +   $ git checkout tags/&DISTRO_NAME_NO_CAP;-&DISTRO; -b my_&DISTRO_NAME_NO_CAP;-&DISTRO;
>   
>   In this example, the name
>   of the top-level directory of your local Yocto Project repository is
> -``poky``. After moving to the ``poky`` directory, the ``git fetch``
> +``yocto-docs``. After moving to the ``yocto-docs`` directory, the ``git fetch``
>   command makes all the upstream tags available locally in your
>   repository. Finally, the ``git checkout`` command creates and checks out
> -a branch named "my-rocko-18.0.0" that is based on the upstream branch
> +a branch named "my_&DISTRO_NAME_NO_CAP;-&DISTRO;" that is based on the upstream branch
>   whose "HEAD" matches the commit in the repository associated with the
> -"rocko-18.0.0" tag. The files in your repository now exactly match that
> +"&DISTRO_NAME_NO_CAP;-&DISTRO;" tag. The files in your repository now exactly match that

Technicality but I believe this is incorrect in git. The only thing that 
matters is you check out a tag. The tag may not necessarily be on a 
branch (it is for us, but it doesn't *have* to be). Also, HEAD of 
whinlatter may not be the latest release tag so that is actually incorrect.

I guess we could make this a bit more palatable (and proper) by 
rewording to:

that is based on the upstream tag in the repository.

Maybe? Separate patch/series though, not a blocker here.

Cheers,
Quentin

