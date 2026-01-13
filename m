Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 711A1D29DDD
	for <webhook@archiver.kernel.org>; Tue, 13 Jan 2026 15:09:43 +0000 (UTC)
Received: from OSPPR02CU001.outbound.protection.outlook.com (OSPPR02CU001.outbound.protection.outlook.com [40.107.159.12])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.60940.1768316965726786031
 for <docs@lists.yoctoproject.org>;
 Tue, 13 Jan 2026 07:09:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=c5ztI+i4;
 spf=pass (domain: cherry.de, ip: 40.107.159.12, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EGoXpr1DVJSJmcKkHjzBnKydiUTWwJ+5b4KkFWFS4NnCSEd6HwvQ4V1jEr6qU0vPbqY3kIZ9bZad3Rd+/dnD7zvK+W3f2AoL5qWwrdNxr50pR9xM7VSRtJsaLTZwHddF5o4HdrdWnUYM7UrRjse2CGLtKHtc7A/2ZAa+lJrjzNYceE3BOLBntzZlCDJOpF+yAfymPYvaQqCGkuJrigj1/suOmiB+KJwj5qcg6rJWLFsFzv6V6mOhzQ7vUiX20Rbno1EHbSdpsytv7JHwtu7ci3vtjBGYSo4V6v25a3XqUdv69C5Pqcfl8GIg57ommcQ1Cw6ecYWxOhXRoa+paKku/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/UgLnTQLM70Y+lA0UOJhoBmCN7ehpjm/XGfkyINp2eQ=;
 b=DwBndelOsreFGv+vgEYJDYqShRBYe62pkQxrHBye+oZ6NlVpSWZEuBth/6lsPpmxpOg3MjyqXjCgVPSIc1jPKZO6tGTodiFEKee4RbkryX5Ruz9NpnQ0InseMbPvhHNx5QPEk00/CNnWwn9HA9PD8IhvrK4YlLskNxPisMbXgrw7ZGgukc5Ck5+qalFYA1Bsrk5YrV758tacE/1UmIHcX8cmwGWl8sgRrTO2kDquY3MPAxL2VLx54VretxfekH2IWRRoSucCd93RoNDb5xWl8iXng5G3Kxxto8myy4AcZ/zXpCy/Xmr9qxQDBotldVUwzPPN5DGi2p20QPNTOgUIeA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/UgLnTQLM70Y+lA0UOJhoBmCN7ehpjm/XGfkyINp2eQ=;
 b=c5ztI+i4aMmBCrlMZey8TJkGMsaPfKe2geJ74Ceeq0RWfmh5346G3s2wckZOeLMbdMHpx7/TieMMlCEV1r8/gqvOhupvSuRFv9x6fzyFPuJzppa+1a6RQ7si4JE0bHn42NNkY5tVsxFM77cDcbdNUYQYBd9Z2zr7ue/DD8Sm/94=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com (2603:10a6:150:2be::5)
 by DU2PR04MB8998.eurprd04.prod.outlook.com (2603:10a6:10:2e1::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Tue, 13 Jan
 2026 15:09:20 +0000
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::1033:5a9a:dc18:dad]) by GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::1033:5a9a:dc18:dad%4]) with mapi id 15.20.9499.005; Tue, 13 Jan 2026
 15:09:19 +0000
Message-ID: <25ea6e5f-da77-4db0-82ae-d6c3e190bf7d@cherry.de>
Date: Tue, 13 Jan 2026 16:09:16 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH 43/53] dev-manual/upgrading-recipes.rst: remove
 obsolete poky repo references
To: antonin.godard@bootlin.com, docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20251224-remove-poky-references-v1-0-658a5f4dbde2@bootlin.com>
 <20251224-remove-poky-references-v1-43-658a5f4dbde2@bootlin.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20251224-remove-poky-references-v1-43-658a5f4dbde2@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR04CA0057.eurprd04.prod.outlook.com
 (2603:10a6:802:2::28) To GVXPR04MB12038.eurprd04.prod.outlook.com
 (2603:10a6:150:2be::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR04MB12038:EE_|DU2PR04MB8998:EE_
X-MS-Office365-Filtering-Correlation-Id: d21af0f5-5e38-4c87-cee0-08de52b5b9ca
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?UmRnTityWFA5VFE3S2xETkx2UjFxdUNVMnNOS29yb3FZZHZvc0t3dVI3N0Rh?=
 =?utf-8?B?Yjl1b1hIRUZLRXlGa2J0YXg3NmluWWVMeDZRN3VkSmJJbWxjeGVLY1Q4Z2l5?=
 =?utf-8?B?bG1FWkZvSERJR3dtbDJ4Q1dGZzdYQW5SbzRuTUNlWmtCT0hkT2dzU25rdXV1?=
 =?utf-8?B?UUpVV3ROekRJc2JCU0ljS1Zwb0pvSUtRc0YvYXQwemhiVm9ucXM5akxhdXRq?=
 =?utf-8?B?S3RVSnNpOTE4TG51Z1Nwa1pYVThGeTZGTlBFYTRHZFJFdHJScXZJZGt0RGds?=
 =?utf-8?B?K1Fybko0amhtWGEwclVCcUc4SytqMGVvYTVmYmppTXdlRXNoOTZid0hlUkhp?=
 =?utf-8?B?WUVJZnRuVXh2eis0UDluanFVVHpaTVV6UDdKZ3hTNEFBKzFZYXAvWCs4c1ZI?=
 =?utf-8?B?ZVIxT0ovWk94SXBWNDBsQ0Y5T1JEdTdzOFRBSjB0aUdoVzlGeldhQjlsenZM?=
 =?utf-8?B?LzNSaFVoQ0JUc1JjNWdmZE1Nc1QwWVdsNFRUZVlqZm5EZC9JSVIySG5SWkx3?=
 =?utf-8?B?R2dNUkM2c21oR3ZtTXlHd3ZVNU9oZmRhY1B5TnRkaWhKMThuc1kwVWgrZkJR?=
 =?utf-8?B?ZkhNYnRmc0xYOXVkemhTZlRnNnk0UVhub3cyRVRDZWhjZXBWRytPa0lVYlFL?=
 =?utf-8?B?UVRoUmZPVjIwMDYyVk5sWTQrZDNZNi94UlZpOGNPWjlseEdwT056S1cxNDhC?=
 =?utf-8?B?NUxRQkQ2bS9yQkNqdURFVVF3UWt6L1RnMitvYWMrMmw3YzN3ZUxGV1ZUekgz?=
 =?utf-8?B?bitSNERsTmNmYjNhZjcyc1FUVjNYR1B6V3lUQ2xCREZWWUpoY3ZZQmxaMmpW?=
 =?utf-8?B?RC84VXd2bzc2QnVoYzdPQ3dUN3NlWEJ4dThyYzdHSEp0ZlhUZmJLcS9MbTho?=
 =?utf-8?B?YndDRlpvTHRRQlprckpJRTJFdE1qUG1KRW9GWGcxRzJ0UnZnWmlmeEN5aUxn?=
 =?utf-8?B?ckZrVzIvUmZuczJQT0E1cDZhSVRWd0FHaEpzSXlYT09lWlc1bmpHTWZvaFNY?=
 =?utf-8?B?UlRSNU14RjFOQjZrN3llaHUzclFPQTBhYTNnbSsrNStwWkVycDBBMS9xSjFZ?=
 =?utf-8?B?SXQ4WkpvZkpwdXBFaDg1SWl4MHAvRVEzZkVxUkxadGFZNUxZb203M3h6Um51?=
 =?utf-8?B?YzBrU2V4SGVGNFQ4bnFaZWFCd204cFFjSDNzd0pnU1k2bWNnQTBTWGwycHh3?=
 =?utf-8?B?T0lPWGFsc2w5RFBOamtRUVpJTlJ4UWtHUm9uUDdmNDBWNHR0UXYxTVZLT29L?=
 =?utf-8?B?UDREQzE0M0p5d0VITkxndCt6OHJtT1g0ekRtN3U5anVpcFNhYlBRRHRVR2pG?=
 =?utf-8?B?MXJMdU5Ed3U3amdWc21YRnNZTDNDRGN5R1hic3pRM1Rybkd3RXE3OEhDOXcz?=
 =?utf-8?B?Y2p4elVscmxJWWRheVJtODBoaWRMbjVEbXB5VzVPQlhyUjFQWnlvbnZxNmxT?=
 =?utf-8?B?cG1tS0VxTk5iUnRWa2E5b0FxeExOVFgvK29yWmQvYSswenRuVWZ4U1ZTamtN?=
 =?utf-8?B?MG9xQ0ZSUXpYVk1MZjB6d2xYVmpZcitFUkdCcTMyeTNRVWtSOWpwUDJ6NUpl?=
 =?utf-8?B?QXVFMWZjQU13MC9vTzl3RmlnOVYrU1E2TjdhWDJpS083S2tFZ2NaUWJWeWNh?=
 =?utf-8?B?MEFac3JYdUNEUHJvUE12a1hDeXRKMExzNkRBREpLWnlxanJodHpwcFJtTjBD?=
 =?utf-8?B?OVBmMXE2UXJlUXppSzMxRjFXaWRtRjZvaGdYdUhoSW4zMGh3Tnk5RlQyRUJp?=
 =?utf-8?B?VGlHVFNEaU51SmpuV0s2RWRRcVB4WWdaVFl1Yk1lTjNuUkE2SzNOaFlHckww?=
 =?utf-8?B?dEZ3Rzh4cmJtOVpibTluNm5Scnhoa0p1SVJ6T1Z5UzlFME9wV05NYlNuVTJa?=
 =?utf-8?B?bkVjTEdjNXhQTDM3Z2Y3TkVIM1hDTFg1dEdlYlZPaFhhZmFIM0RnTENnQ2Zi?=
 =?utf-8?Q?d/UYuzRfImKWYYXipZ+ysfp9hkLZml5c?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB12038.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?S1FBUmdEQ214aHZ2bTlxVFZFeHFiQmJtR3pVNG03Tm41bmpxaHZMbmgrTU1K?=
 =?utf-8?B?UzhLTUtLYUlBQ0ZuVHNiR3RaR21jUkZFMjY1eWJQNUc0UkttOXVPck40NlIr?=
 =?utf-8?B?a0tZZXlicFhCQmFqRDdiOVRsL1l1b0lKWWF3b2hjVVVhUWhHbHJzc2IxRTNP?=
 =?utf-8?B?bE1sYmc2eWUyNDBobnQ2NFg5ZXdoVC9vQzc5L01MSHFYQnVYb0REeng1NjB0?=
 =?utf-8?B?UGsrN2hTTmd4MnFHVkRSNkpjcjVBNEJIUmFnQWNkL245anF2NGtwbVFuZllj?=
 =?utf-8?B?aVlmU3N6ZGFtOGJjRmRVc3JiVTEybXljaW9zUHQvTXNQM2hSVktEUWYyNVI5?=
 =?utf-8?B?a1RHYjBtWXlIYnF4YXovSXlWMkVta3pabVFIYUlCV2dmNVRGQ0w3V1ZsVjNS?=
 =?utf-8?B?VnBtNkc3VVZjdGRWbUhkTVlCUmNCY2E1cmpXcmNHWHZ2eUZNTVRFNlFrQWgy?=
 =?utf-8?B?cEFuQTVoMUdSaXo4V0dlSVZMbkNSdEQxZHkzZTRxamJlOEE1V0JITGhHUHlT?=
 =?utf-8?B?ZkZMNmhKeS9DV2szU3JMN2tqUGxGbk5SZWhNY2pQSWlzUzMvN0RuWDIranlk?=
 =?utf-8?B?N0gyTWhDVHJaRGRIZkM1MWxDTFAvNmU0SmcrVllwSjBremNyNmRveWh1a3Ft?=
 =?utf-8?B?YUxwZWkxRy8zODJzL0ptdVNEclhGSUtsY0pnOU5iVmIxWTd2aUxBY2dDTDg3?=
 =?utf-8?B?TWVsNlpDSUJ1eXU5cmZhQWRaRE1ZSTg1T2dPSU9RTjdqVkRNTWtxV2dxNUxJ?=
 =?utf-8?B?bnE4REJLbVY2NUw2WFU2ZExqK05GQlFJU20zRmdoaTVRVm9ZZ2VteVJ1MVYr?=
 =?utf-8?B?Y0hYelhETVRJeU5nNWV1YlZLV2VyNkpMTEQxN2tpcGFEUU13TE1Kai90SW8v?=
 =?utf-8?B?aDM3MVFUZkNXdE8yUzRzc1RpWFhROTBONjhoZHhoMTVzSkZpdGVGendSYk5Y?=
 =?utf-8?B?V1VsaXI4eTFHeUtqdnc4a0o2NytjdXdVVnltWkFuS1huMkVDc29KSVRHUVBL?=
 =?utf-8?B?TjVPRk5xY1VYVHhBUFNDWmIxVC9OYVRUeEFKbURwR3dMb210eU01WE0xVzcx?=
 =?utf-8?B?T0FVU0pNSm5TQTFLaGhYRWhwOUpUR1ZzUWVnOHMyT3dXSXRPWVlmVlhYRFht?=
 =?utf-8?B?MWhvN3NpeWlZRXE1V21IQ0hPR3RXUjJuMis5SGZ3eGVNS1NMUWNqcUhwZ0g0?=
 =?utf-8?B?ZmM4a2xiZmpVQUk5RTJQZ05wa3JFZm1GR0VybVNQcnlRRVM2azZ4OGhwUlpK?=
 =?utf-8?B?L0IzYTJ1bnZPWTlnSVViWjVQVGRvV1NLOHA5MHhnak9uU3JlOXM3ZDRBYUhT?=
 =?utf-8?B?UUhETzhsRm9ubGZ4M0ZVOFdJSnYreEVMeFpFdVk3T0RSVlM2TGN5NVpWeXdV?=
 =?utf-8?B?V0Z3ZmZUakpQU0FyRVlKNHEvVldSaERaa0ZvbUdxTnVWR0RmU3lKZGc2c3M3?=
 =?utf-8?B?ejUxQ292d2lrdkhjUWZjOG1uQ08xdlVsT0Nmd2MwOG1WaUdJbUY4ZmUwU05l?=
 =?utf-8?B?Si9PUHJMZVlZMlVtajFEUWtzd3hmSnRYZUZZU0NTdUgxK2RjOWUweVQrZFBm?=
 =?utf-8?B?d2FVWlljTVpaQ3lHcUQySFlCM0tEekNVL0NnUXN2aUVUUlJPeSt1TDhla25p?=
 =?utf-8?B?WGNWZUtkUTlCQ3h3U1EvcC93NlZWUDBUdjNqWldRd0VDYjBseHZIbytZZm0y?=
 =?utf-8?B?MUhWUE04RjQyaWh0NFpNOUdJUllNeUhiVkpzaXM1VElWVVFYc3B5TnRPcGZB?=
 =?utf-8?B?aDRCWnNnRHZGcytJUm42cmliTmVNY3Raby8zazcrV0VMRnBrRElmNWVzTzdW?=
 =?utf-8?B?aGJ6TnFtSlluZit6TXFyOFpDQklYVHVxTm5vQ2tMQ1ZaL29hQmtqMGJVbkpS?=
 =?utf-8?B?MXNoWHJDSHZYYjRjNDlmUlFiaVNwSE1zVGdyeWE0N2hkRGIvbmZWZWtma2Yr?=
 =?utf-8?B?dGpDMEQ3NzlDZXExaGlYS2tQN0x4R1FSMy9iNmpYQi9FLzVpMFplcEFkNVlP?=
 =?utf-8?B?RGVMeSsrSVhHY0JVUnBib3p4b1VYeE5NVi8rVFpCTllybUp6aU80aXBTNFJU?=
 =?utf-8?B?eGFDeXJ5eFR2SmNoV3lBUFNLcmlkQmQreWhIc0JyS1U2WVcxUXZRUWl6TWZH?=
 =?utf-8?B?MkNMRzhjZXVWOHRGWHdmRHdqTXI1UVJXWndXSUk5UEdyZkg1MzQ3ekVYYUVK?=
 =?utf-8?B?ZWtkYzRRb0NHbkhJMTVEZHRqQXF3UndnUU4vemhUYkdZUmZPdjRiOHk1STM5?=
 =?utf-8?B?ajladE1SWGdyY3ZyQTBDSmNrREdNV01wOUhsUUQ1Zy9iRWR5VkhDRTRmMmQ4?=
 =?utf-8?B?djh3SnZRMnRQNzBWbHc5SGdhMWRLeW0yQnpMNEJ3TGtzUGdpTXBpdz09?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: d21af0f5-5e38-4c87-cee0-08de52b5b9ca
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB12038.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2026 15:09:19.4334
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1s8Vvkefc5fARGwpf3l/hAeGE7MzQ+veK+PLxV5Q5NGE8kNMPOvT/aZiFSv1ObrciDmhiVPCdjZon7G2IjkkHyLJGtJjIdUr2y6fgPBMK8w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8998
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 13 Jan 2026 15:09:43 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8532

Hi Antonin,

On 12/24/25 5:32 PM, Antonin Godard via lists.yoctoproject.org wrote:
> Refresh the document now that the Poky repository is obsolete.
> 

Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>

Thanks!
Quentin

