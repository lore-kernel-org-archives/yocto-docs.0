Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B875AD2595D
	for <webhook@archiver.kernel.org>; Tue, 27 Jan 2026 15:19:30 +0000 (UTC)
Received: from AS8PR04CU009.outbound.protection.outlook.com (AS8PR04CU009.outbound.protection.outlook.com [52.101.70.58])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.13823.1769527164108087913
 for <docs@lists.yoctoproject.org>;
 Tue, 27 Jan 2026 07:19:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=cOPnKsON;
 spf=pass (domain: cherry.de, ip: 52.101.70.58, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TibPE2esX2Do5nImyzUezRlekdmTa7j+DgXBRzIKipIejv8q2VH5ycHQN/n7aHBqv/TH5ISBI5faX4FypmdMBJuaJqtayeNw5T51IbwFWTkebjxVl9tYPsU9296gbOrfswZn9dwCZLMpsBMQVP3FoJqsHK9giVEFN/BNI3P7RdZPA6pJywkLAZXO3HrvImLZA3XkqDK0ITVbgtThYbM13pG6ksT2VoxYh17mFZGYJPi9+2x0k3G3Utw4t2KIfuHzlx8WdBPaYrqHvzdK+vA8vHALApOWzwEDV23piuyAf1rmZlyd8hIGuS0AdqSGrYDdizyu7+uGJNKkReemZ0YADQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uZTBs4+w6yglrhvw7fa9TWB4zRvnpgXMsitqoFsSv0E=;
 b=sE5ujpZTxphA/z9QsQRlWzuGm9tO6r8sCwgx01qwcE/s1TLuQmRCKgV5QsYXQTRGeRL2o9UXGBKh/6AKbLi9NmgqfzrrcTxSX7e56ySbxDxotKw8GMTeaklAWcgj+WPQlCEhhDtamKmpCbXaWIRdteoEuPH3iBEhEJQXLItZfRTgdQsqvK0rRhzcJKcFFDVDPJ2UO06UYoCIYsFU7DfTRzuL5w8mDkx0Gj8RDPblm/mGSKKSoH3boETKxJs3w7CKPDhKl8p70maswjD+W1zNM6miVZzipr+YYGnqaqBo7AWX0NrJW8FAJB62HJg3UO1ZzLZty9NqvEtjZiZLmNMstA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uZTBs4+w6yglrhvw7fa9TWB4zRvnpgXMsitqoFsSv0E=;
 b=cOPnKsONomjwMrl8/rO664sam2zNYgmpncP1XgD6tkQiMUdVPtsDI3bcFju4TX+Up4xeNRqxjY5UWGmyKg2EabEmVfw+4+Q4du7w+Kj2GeqtqZp1WCAWRVY91YSSPz9VdZO1hGQIPULYA67z9gDvW7k3vkuV0g7POHWNQ3Tspus=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com (2603:10a6:150:2be::5)
 by VI2PR04MB10569.eurprd04.prod.outlook.com (2603:10a6:800:273::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.15; Tue, 27 Jan
 2026 15:19:17 +0000
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::6c04:8947:f2f0:5e78]) by GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::6c04:8947:f2f0:5e78%6]) with mapi id 15.20.9542.015; Tue, 27 Jan 2026
 15:19:17 +0000
Message-ID: <563677ee-52c3-406c-9740-1f902e01d229@cherry.de>
Date: Tue, 27 Jan 2026 16:18:59 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH v2 11/56] dev-manual/layers.rst: remove obsolete
 poky repo references
To: antonin.godard@bootlin.com, docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20260127-remove-poky-references-v2-0-74bf80cc4e5a@bootlin.com>
 <20260127-remove-poky-references-v2-11-74bf80cc4e5a@bootlin.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20260127-remove-poky-references-v2-11-74bf80cc4e5a@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0259.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:e8::9) To GVXPR04MB12038.eurprd04.prod.outlook.com
 (2603:10a6:150:2be::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR04MB12038:EE_|VI2PR04MB10569:EE_
X-MS-Office365-Filtering-Correlation-Id: 9b14aadb-ff76-438f-d36b-08de5db76fde
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|10070799003|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?d3NiRENHbzBNaU83NEJnUGpOS3UyVG5jRnd1eXZzMlRPZGVrVWhaYW9GVE5s?=
 =?utf-8?B?OFEzL2d6TFF3QVJWcW1UUzZjSlpJNk14cUFDODlxVWhxZWc0ZVM2OFRJNWVu?=
 =?utf-8?B?bHJxYWVOWHgxUS9zZm9yQ29zL05nVVRSRDBJOWNDSCs4T2diaGc4alhBVEtr?=
 =?utf-8?B?cTVrKzg0VGhHZ3Z2SEpyUDJhTW5BRWQ4WkhnYjk0QVJBQVU2a2JTUHJFTlRw?=
 =?utf-8?B?anAwZ0p1NzFISXJSOEtkdVgweForTHA5cU1ZZGZSZ0xCNDZTY2ZCalFxZmhT?=
 =?utf-8?B?eHVkMVB4NlhyeHF0VTZQdUI3bmFVMUk0Yjk3M1BCa1haWUFIQklmUlExUEIx?=
 =?utf-8?B?NlpldkVROG5NVzhMZjVWQzF0Z2VKdkNWZkdtMUJKd0FFMEZPckRwT3JFbElT?=
 =?utf-8?B?d2J5bEwvS2IrWlBScUNYcnY5R29UNTNzY3lrUU03OVkvTk0yL2Jyd1RqYWJ5?=
 =?utf-8?B?TVIyb0R6SkFsUU1aOTlpNXFOT28vSkV2cGl4VGlwbFlKU2dYRXNXcEI3cmk4?=
 =?utf-8?B?aDIzdG5TK2pjRWZlcGFuOFNMK0xCUERMdFRBZ2E3SlhDREtpSHdPdW1NNFpZ?=
 =?utf-8?B?TjJvNTh4eDF3eGF6ZGoxZG1tMjVsRG9LS1hBVUVXbjNudHJCbE10dkRGbHNz?=
 =?utf-8?B?cCt2UjhiTEhiWUFocEdDa0FCNGpucXhEaTFEc3BBTlltd3BTcUZ5T0hDbmxG?=
 =?utf-8?B?Uld0VXB3Yi9EZ3o3WXJ6VURZRUVMdTI4UjM3U2tYWlREL2drb1Nsbk41Uklz?=
 =?utf-8?B?TldhdkkrZEhzMGdCVUQ4VTJadVJab3p5K3FGTU9sNFdMazlKODNIMDhzWG9h?=
 =?utf-8?B?V1JCOSttZXhYYnJRbjFDRXFsRTFVR0t1d2xET1haWnkvVFdwUmtaUmprbjJk?=
 =?utf-8?B?MS9YaHhpcDdaSW40MXhyaG1rNlZlWnd4UStWTCs0OXVFbXRpdnRCRGtvZFlv?=
 =?utf-8?B?Q1NKc0Z5OXZzellHMDF0Nys2cFZzVnZOb1J2cktNVjN1K0NUMWdEcm0vcVNk?=
 =?utf-8?B?K1hOUHNnUEtZRTA4MnhNWng3TysvQVBlOFZkOEpUcmlKNHE3dWo1MmQ0a3lX?=
 =?utf-8?B?djk4ZFZOMTVEWXBMeFRiOWdNakgxQWxwK0dzclIvcTFnMXFrTlNUUk5hSThN?=
 =?utf-8?B?WTRJVjZQaE1oZ0NkSUd2dDljNFNiMDI1TU92bUVScG0wTmZNV3RqWWx2eXln?=
 =?utf-8?B?VnZNeUJiUkJIQ1ZDby9iSm1JK0dwY3pRaE1vVG5vb0d0YkRPR25GYnEzdFp0?=
 =?utf-8?B?cWlzVXJBK2FCbWVtcFd3TFZOOWdrbDl0cUs0WFNpMmVFNlYzcURGSk1xTXNk?=
 =?utf-8?B?TzNOV2V1aGdwbFREbHhYSDR3OGF2S2YxeFBhV0xhVll3YnUzUFljZHI2SE9j?=
 =?utf-8?B?N3VVdlQrQ2R4alpmb2liR0VmTlVhMjNENVpuNjRrVGk2eUZxRzF4cTZ5amRI?=
 =?utf-8?B?UTBKZ2hBYTJXVjlMOFVMdGVFUkpIMXB2RDAvTEVPYktKTkRjQnpLZE1rcWRP?=
 =?utf-8?B?R2ZpTm9sbWEzMkNRdHF3K1p3a1ZuRW1qZmxINEhVM0dFUWpaY0Y5ZkRhK3pZ?=
 =?utf-8?B?SzZoKzdKZlgvQlVvK0Y4UGZiUFdqcjl5RVNpemgwTUpDY3lFTWZTOUxZd2lL?=
 =?utf-8?B?dzZ0N3VtdzdyNjZka1JvSVJNZ0VydFVrNGFIUlQxSlZWUjJNNWJuL1RNOXdk?=
 =?utf-8?B?SmViNTQ0MWVIYkVsUWpYdnBQRm9OOXJCZFlSUnlwbHRDa2ZlNUdHZ2E2MlQ0?=
 =?utf-8?B?NkVHTGFQYUdNTnBwUjU5dG95Z1ZsVlVocVBrT1NuSVpobWFlZEJqV2FoQmU0?=
 =?utf-8?B?UlZrRVpoYjZZc0IzUDAwMHFrUEFwWTZ3SEVDNnVrczErbU1uQTNraUtCREFY?=
 =?utf-8?B?OHlJL1VMdVdnNHU5ckFSV21HQ3FjTVlJelo5eGZUaHZhV29NWGJDYjhHYVBW?=
 =?utf-8?B?WXUycHArbExGbHBRWGNmYWRPTmZYRXR2Q0hpSmlUd1ZZYTdzZGp2VlNMMGZj?=
 =?utf-8?B?dlFiUUNHYk5XNSsza00xRXFZT2xzYmltWUkvbDh1UUQ0MGp2VUU3Tm1aQVdu?=
 =?utf-8?B?SmRWNzhXSUJsUytlSnYrUUt3Q3RUZ3RIYkRKaTBESzcrYjZEQnhUVE9mOHhl?=
 =?utf-8?Q?oF14=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB12038.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?RTA3RFpFTk9RSWx2VmQwKzQyTVhPZUt6QncyamJnZWxNditkTWJIRXNKbEs0?=
 =?utf-8?B?WkJyRExpOGdKUXhvdS9IbmRZcTVtWGZWYXU1eFE2RWFoanFIUG0zR3VOYlNR?=
 =?utf-8?B?b1Q0Q0ZaL0ZGdS9CbzYzSUtleEJTZW9RSzlzVTY1LzB6QTZRU3RVRCtaeWlM?=
 =?utf-8?B?RVZ1eGxORGJEM0xRRUtLRm5FNUYyN2tDTzcyazZrY2FYeDBDWGJncXUrNkxR?=
 =?utf-8?B?VStURlZlRnpCOUxvMlV6dyt2enQzazU4VVBIZWNQY0EyU1BNeFluekdTRTVH?=
 =?utf-8?B?ZC9Yekozc1B1RmYyMFVLZkFaUG45K0RabUJ4VWRXdTQrQnlRY1ljVnBRS0Nn?=
 =?utf-8?B?aE8xbmltLzR5dXdtRjBsais1Y2RLNDJtdkxrajZMSWh4WkdxRzJQL2s5Qmdm?=
 =?utf-8?B?ZG9SenY4QXlrYXNqNUpUZjZhRG1lM04rSndwNFR4elJnV0JLREVLRjlOZ0JY?=
 =?utf-8?B?bU53d2FYT0toTzZiNWFndVRyWnZ1ZzNlZ3JmQlFqRFVYZ0RLUUNaNEN0YUdJ?=
 =?utf-8?B?ZVYrMUhoNVRPamtOM0pHanJ4SUVidW5CSDRiV1FrcFprY3RGNGFpWlhVQW5X?=
 =?utf-8?B?YUxFZ01yaTRwaExtSUVvNlFjK0VxOTFzblAyMXdkMk16VkJscHRSTlArN3Rm?=
 =?utf-8?B?dDhaR1cxdnRwTTdBSS9qNFdLQ0QwQ29rL3lnQ2dneVdHdDlWc1FYUEloMURY?=
 =?utf-8?B?YmlDN2I4UkFLeHZPd0I1K29GM1BHbm1MTHBKZk42R3luN1NMTWRzMXhlYVJk?=
 =?utf-8?B?OXlSQ0pVSUVMM3NFWnJIb2Y1UDJGdUlZeFkxVGE3aEtWbThEVkczYVd0eDAx?=
 =?utf-8?B?a1VjQkUraGI3ODdqY2ZFTWVSSFVVbXVocVNTcjlpQ3ErUlNHL1FidFBCR1Vw?=
 =?utf-8?B?bEJTYmVYWTNvQ1VFcU5zYUEyVXFIeEIrbkdEc2ZTQjBGUUR1NjU4ejhZcGxF?=
 =?utf-8?B?WDJTOTlDNGZDRnhwTlFCM054TWZCZFJtR2wrYjMrNzY0UGErYlNHcFFtVWY4?=
 =?utf-8?B?RmUwTUI4L3hoU053VTBZdVJtc2xNUDEzaWtRUm5EaE0zT1FlSmFYb3RLSHdY?=
 =?utf-8?B?dngyK0ZwNWdDcmdWcEVyNjFNcDF5SVkrYWd2RzAvRnZReTRzQzRTSVEvUjEr?=
 =?utf-8?B?aitETjF4MVRLL3BPWmkwV2QyY0dWZjQveE1RdmlKdlVhTTBaNGNybnpqYk10?=
 =?utf-8?B?NmRvUEgraVRrLzJRdnVIeVNuRk0zdzg4ZmJlcVJVNkt5NnJCK0VrWjlsbkl0?=
 =?utf-8?B?TE1Hd2lDSndGNUhSSVJXVU8ybjNNYytGenU0d3FnWVVTdVZWT2hKYjU3MVp1?=
 =?utf-8?B?WVhFeENtUTUzaHNYT1pxUW5zOHcyY09NVVBkWnNqU3k4UmdrNjkwMWQ0bUpm?=
 =?utf-8?B?eGQwVUJ2b0ZaWE1SNmQzcnpYWkxpUytRd1VCbVFHNmFpMksvSWVjMmxKUjZV?=
 =?utf-8?B?Unp6Ulk4dmV5bmdSaTNzVUFaa3lGZGNKYmdkbTNHMmZQbm0rZW9OeXp4NTU2?=
 =?utf-8?B?cEVLbEZkUVRRZENFWmlMVVRsdnVlTW5tNzR6QzFRQkV5Y2tqRnJQY29YWlNt?=
 =?utf-8?B?bVlQNTh5QXpqK2JqbVdpYnZVNnkvQUdlSU1OR1EyeGFVazVjc2dkeWdHbjBl?=
 =?utf-8?B?Wi9xaXB6eVc1SSsxKzZ2WXNwbXRyTDV0UEp1SDB2cldEVzNFc2FHQ25aSlZH?=
 =?utf-8?B?eFU2cGxIaVU5MGpFTDhOVDJEUFdNVUFUSmRtTnlQWkJidXdFQ2IwbExUbWtl?=
 =?utf-8?B?ZHU1MUdFSk9lQ2F1eDB1bm5MZUZQTWdFalFuT3NRaFlNeERWNUlrM0N1cU9P?=
 =?utf-8?B?cXRtMmNNYkpaK1pvbE5PNmhDRnd1TitGd0ZvdFlLRFhlWUV4UzVEYzFKblVz?=
 =?utf-8?B?ckhPNlYzMTZMTFpIbi80cVJqLzRTSmpOaFptMHM0aGgvZENGVWxMQ2tsRWNT?=
 =?utf-8?B?ZGIra1NSM2YvOFhrM0ZHRXNkSk9KS29ENlJZb2NLcDRJYlV2aG5zQVBLRWtW?=
 =?utf-8?B?djUxKzMybkZ0UXRXOHhLV3FWbEVQaXc3RVZVRGh4TkpWV0c2bzY0cFJic1pP?=
 =?utf-8?B?VFJxUWE1a0lUaHMwTUM3UlhHT2xxY1N6OWt5VE84MmduM0hQVU5UeWVucVBR?=
 =?utf-8?B?YlF6M2pKTnRMV2tuMTUxSlZnSFFWemtabnlHazZtVi8veFJkcXRsUWp5cGtl?=
 =?utf-8?B?Y1hlb3FKVk9hOW1BVFRwRVZnUFhqUXFucm1ma1ZZVEJ2T2trKzVSanNQR0RQ?=
 =?utf-8?B?UnhMdkw3N2VnU0RVTWdISms0eHJuZVc5VWcwZHdjM1owT1pOWVo4TTcvSG1i?=
 =?utf-8?B?UGNzNmtpS2pGbmd5WUxwQlhKdjRPaWt5QVFmellzRE02ZXNqSWpkeWhtMjQv?=
 =?utf-8?Q?s5dDnB6eElVygOYpeLUuKqRpask7mIet+qBYM?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 9b14aadb-ff76-438f-d36b-08de5db76fde
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB12038.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jan 2026 15:19:17.1401
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: c/JLBCVRqt7fZkL3OWf1l5+jElyRUHgUrtYIbkvE3VJjwzX09tAUNh/WHJ6bcSUqjBjvjMCs/Yby79hGlvSQBzoyWKQCosRc3SD51AO53Rw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI2PR04MB10569
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 27 Jan 2026 15:19:30 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8740

Hi Antonin,

On 1/27/26 9:19 AM, Antonin Godard via lists.yoctoproject.org wrote:
[...]
> -#. *Create a Directory:* Create the directory for your layer. When you
> -   create the layer, be sure to create the directory in an area not
> -   associated with the Yocto Project :term:`Source Directory`
> -   (e.g. the cloned ``poky`` repository).
> +   .. note::
> +
> +      For information on BSP layers, see the ":ref:`bsp-guide/bsp:bsp layers`"
> +      section in the Yocto Project Board Specific (BSP) Developer's Guide.
> +
> +#. *Create a new Layer:* Create the directory for your layer. The
> +   ``bitbake-layers`` script with the ``create-layer`` subcommand simplifies
> +   creating a new general layer. Place it next to the other layers in your
> +   :term:`Source Directory`.
> +
> +   In its simplest form, you can use the following command to create a
> +   layer named "your_layer_name" in the current directory.
> +

suggestion: s/./:/

[...]
> +   The default mode of the script's operation with this subcommand is to

suggestion: to make it a bit easier to read:

By default, the ``bitbake-layers create-layer`` command creates a layer 
with the following:

> +   create a layer with the following:
> +
> +   -  A ``conf/layer.conf`` configuration file with default definitions.
> +
> +      Here is an explanation of the typical content of the layer configuration file:
> +
> +      -  :term:`BBPATH`: Adds the layer's root directory to BitBake's search
> +         path. Through the use of the :term:`BBPATH` variable, BitBake locates
> +         class files (``.bbclass``), configuration files, and files that are
> +         included with ``include`` and ``require`` statements. For these cases,

suggestion: cross-reference include and require directive? (separate 
patch/series)

> +         BitBake uses the first file that matches the name found in
> +         :term:`BBPATH`. This is similar to the way the ``PATH`` variable is
> +         used for binaries. It is recommended, therefore, that you use unique
> +         class and configuration filenames in your custom layer.
> +
> +         See the :ref:`bitbake:bitbake-user-manual/bitbake-user-manual-metadata:Locating Include
> +         Files` section of the BitBake User Manual for more details on how
> +         files are included with :term:`BitBake`.
> +
> +      -  :term:`BBFILES`: Defines the location for all recipes in the layer.
> +

suggestion: mention bbappend as well (separate patch/series)

> +      -  :term:`BBFILE_COLLECTIONS`: Establishes the current layer through a
> +         unique identifier that is used throughout the :term:`OpenEmbedded Build
> +         System` to refer to the layer. In this example, the identifier
> +         "yoctobsp" is the representation for the container layer named
> +         "meta-yocto-bsp".
> +

suggestion: :yocto_git: link (separate patch/series)

> +         This name is used by other layers when specifying the layer
> +         dependencies via the :term:`LAYERDEPENDS` variable.
> +
> +      -  :term:`BBFILE_PATTERN`: Expands immediately during parsing to provide
> +         the directory of the layer.
> +
> +      -  :term:`BBFILE_PRIORITY`: Establishes a priority to use for recipes in
> +         the layer when the :term:`OpenEmbedded Build System` finds recipes of
> +         the same name in different layers.
> +
> +      -  :term:`LAYERVERSION`: Establishes a version number for the layer. You
> +         can use this version number to specify this exact version of the layer
> +         as a dependency when using the :term:`LAYERDEPENDS` variable.
> +
> +      -  :term:`LAYERDEPENDS`: Lists all layers on which this layer depends (if
> +         any). It uses the layer names specified by the
> +         :term:`BBFILE_COLLECTIONS` variable.
> +
> +      -  :term:`LAYERSERIES_COMPAT`: Lists the :yocto_home:`Yocto Project
> +         releases </development/releases/>` codenames (in lowercase) for which

s/releases/release/

suggestion: s/for which the current version is compatible/this layer is 
compatible with.

> +         the current version is compatible. For example: "&DISTRO_NAME_NO_CAP;".
> +
> +         This variable is a good way to indicate if your particular layer is

suggestion: s/your/a/

> +         current.
> +
> +   -  A ``recipes-example`` subdirectory that contains a further

suggestion: s/contains a further/itself contains a/

With the s/releases/release/ change:

Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>

Thanks!
Quentin

