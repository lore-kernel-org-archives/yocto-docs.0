Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 552B0D340BF
	for <webhook@archiver.kernel.org>; Wed, 28 Jan 2026 14:01:43 +0000 (UTC)
Received: from DUZPR83CU001.outbound.protection.outlook.com (DUZPR83CU001.outbound.protection.outlook.com [52.101.66.69])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.13859.1769608895114843369
 for <docs@lists.yoctoproject.org>;
 Wed, 28 Jan 2026 06:01:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=O/XUsWjA;
 spf=pass (domain: cherry.de, ip: 52.101.66.69, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yOS0Axs57e1non1l22+4Pit+d9rZAN/gxfxvAGcCIo/dtz+nr/smu1CrAXUjT2OHe+1kLa7Qgx4myz5oVlJKc9LaCOQohPWBAr/qHfxHTYcNj4dw0Xhoh7JE7mzmhN7Wp/J6/8TkyyyqpdCc5QNhPT8ows4Zu1tOG6QLorUGGk0GvelwNL9fIVi1wf6JrJwEbEq8qyS1krvNr7JwT/7+ftpoQx/TyOG8+QUkUi46Rz9uuWoZU0BbWl6BhACNzbdaAUPgkArOjujO2KhFy1tddqQswZTIyZ+b49oXkrIfB2X65T2UgFOXhJTcjvIit9nknZCHgXgReP5ousZCw6SMSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=28KNDKKnI7SaqkKfax8s++v3j8O1MitSsn+J1LPz2Zc=;
 b=sOJnVRZDVK+nKMtdwmXkA2DPFw12POuA85D7ogeh2p8yog8UOsfQJlGKB1TbWo9IgVvq3mAPPqyBLsswgBczazQeje7xykIBvNE+clRrg+CYIvELqOo/2MnPsAGb0ukPKrIjG1b5/t65t3dwS2leU0rjO9QTqlFVMAdClps1QsPE8YItSJZuqobFDrFfyLMmm1gQcCFtfSxicFNXLUOi1BKM4QDSdFIoPSxd4GFvf4H5A96vGMJFDBOTp0Gn0JTcwj5wGixqqrajRkcRArhK/cSXI0bmtY85HuRbeRz2RssP450V/mOyt2dLTon2B1jqf6QBaASitKtAX9U27CJfHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=28KNDKKnI7SaqkKfax8s++v3j8O1MitSsn+J1LPz2Zc=;
 b=O/XUsWjAisVV6zwFr947eDA4JzrUmow9yU01ltEJsA9ykt9kmLjMfd7XTws3wLTCUA78xFszAyEwCptcgVgz2ROgsSCCTU39Bpo/G5IYq4Ai7hCJv7QA23/d5T5gYfwEt48wRMk89c1i8q5lN61BBIdFwzwwvpTcbMJr/n8bdbo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com (2603:10a6:150:2be::5)
 by DU4PR04MB11962.eurprd04.prod.outlook.com (2603:10a6:10:617::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.7; Wed, 28 Jan
 2026 14:01:31 +0000
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::6c04:8947:f2f0:5e78]) by GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::6c04:8947:f2f0:5e78%6]) with mapi id 15.20.9564.006; Wed, 28 Jan 2026
 14:01:31 +0000
Message-ID: <f6133128-98d4-4bc2-97b0-2d8563d254ab@cherry.de>
Date: Wed, 28 Jan 2026 15:01:03 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH v2 41/56] dev-manual/packages.rst: remove obsolete
 poky repo references
To: antonin.godard@bootlin.com, docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20260127-remove-poky-references-v2-0-74bf80cc4e5a@bootlin.com>
 <20260127-remove-poky-references-v2-41-74bf80cc4e5a@bootlin.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20260127-remove-poky-references-v2-41-74bf80cc4e5a@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: WA2P291CA0032.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1f::21) To GVXPR04MB12038.eurprd04.prod.outlook.com
 (2603:10a6:150:2be::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR04MB12038:EE_|DU4PR04MB11962:EE_
X-MS-Office365-Filtering-Correlation-Id: 8a6a24da-05c7-4b34-d7e8-08de5e75bd0c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|10070799003|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?bkNJTU01WWJHWjlGOWFYZmJ3Z2tGajU3N3paQi9GSlllUXo4TlA4alArU0ZQ?=
 =?utf-8?B?UGFBWkdoaDRFQlNPR3pzWXZ1WmhQckphUFNDTDJ6RkpwM2ZGTFpDaGNzNGtk?=
 =?utf-8?B?MkNJbEFGTEMyeDB1ODJNTDhSaVhKSWpwOWx3NHk2ZUtIaHZ4RXY2VXlOZFk4?=
 =?utf-8?B?V1lhWGtQM3FlOHR5QmgzeXJIc0g1RWU4T2FwUlY0d0ZNRkRWWjNvQXNJeVFh?=
 =?utf-8?B?V010V0xMbUc1LzZZRDFtTVhsRVpmQTMrL1RJNzlVajhidWkwODNreXI4RXpl?=
 =?utf-8?B?c1QzSldGNU5KdFRzTHRaYURlNCtMcGFMTE5YSTJrQnAxYkdFalpiTmM0VUVC?=
 =?utf-8?B?SW8rVXhGVzJsdHl1OGU4M3BuR0VrQjRxYXFGZURyaXd1ZzQxNnV0UThmZ1Ux?=
 =?utf-8?B?bmg0M3czVC8yaEtsUXBiVDFwMzl2Y3QrczV2UkJ6NytXRjJlejhHbjhLVStR?=
 =?utf-8?B?V0ZTQldmWjRqTFVjUUd4bUhNbGVtZ0YwVFJpdTRKcVZEcThvaFpaN0xpeTlD?=
 =?utf-8?B?SW92enZkYS9Ta1hmT2tBQWdpTzlvdnlOMTA4anlHbHV3WGJYc1dYRnU3ei9O?=
 =?utf-8?B?M0VITUliZjF0QkVXOFhzTGR0MWpmNG5aOXZnK011ckdjU0JZUm1VNVFmR21B?=
 =?utf-8?B?QjBkY0RhOE4xVU05a0J0dGg0QTZCV1FGdFdodExubEp1VjBMdDZQWUJzVmtw?=
 =?utf-8?B?TUExZXR3dmMwUXp1UGR6VUl1T2hJVFU3dmxyUmdOa0crTjFTeFY5MytSbWM0?=
 =?utf-8?B?SFRDVjYyWWpxeWRKQTFNNENYTE5WWUVSL01SbExhZk1FZXdwL0xTRnpsTGpS?=
 =?utf-8?B?SklhYnFCQUxIWlFkcTFKbTR6NjEvR3dLM2JCVnU3Rno2V2JnckJZMnM5eUF5?=
 =?utf-8?B?Qm80Wm9sWGpqdlNjZ0Z5WU5wZFkyTXpnam9aQmJoNUNUbXZSZk04WmFmcTRz?=
 =?utf-8?B?dE5GTnFIdmt5SnJWWHZCNlkxMytqMERvTkVmenBSZzJpVFp1Zzk2NEw5NGhE?=
 =?utf-8?B?clRCVE1iU1lkTGRjZDFWNDF2UlJSTmpmRFIrVnVjWkRpNWkraVpjOEVNSmdL?=
 =?utf-8?B?NXVZc0ovYlRXSmYyL2pwbENyT3NrUk9VdlJUYWxVTVd0TkI0NmxRRGQrYVB3?=
 =?utf-8?B?RERkcUZDYVNBRGdFc0VFRHpqWlE0MzRDTmhyS0ZscVQxTFNJekdUTHoyWStt?=
 =?utf-8?B?R096azJ2cXR0Y1ZGVjdJODNLSjFsZVF1Umt4ZEwxRXh3RnB2SXFzUC9LdmNB?=
 =?utf-8?B?ZFZlQ3ErMlVGRTgwZEh5SWdOVk1mSHR4aVp5bi8zNE8wNndoOTRISE52S3Vm?=
 =?utf-8?B?dEJaa0x6OGJ0N0hXNFduUVVOeDc2RXdYWHMwQ3B6aEpScEtReFFER1FHUnoz?=
 =?utf-8?B?TUlzc3ExWGRZOG5iOThnU09wTHhGNTdpNFRYMWdNeURaSzkyRlltNEQ3eEZx?=
 =?utf-8?B?aUdJenlPUXFOY1NydXNhTkpRTXRKM0gxc2VYc0Juai94ZkFjdUFPMEV4TUhn?=
 =?utf-8?B?VnRBcVRoR2hyajJ0OVpwT1JpVVc0blJ6bDB0Y3BrMnZLck1FT1h4aUhXUWs5?=
 =?utf-8?B?ZkZjTC92MWVnQnh0dGszVVNVaDFtVGpYK0pTWWp0NFc2UGFHUFJiYnBqVzU0?=
 =?utf-8?B?ZTVDc0NQZ0liSW9GNlIvL2sxOW0xYnJJVnYyV3d1dHM1SE1ncU9adGlDVlBa?=
 =?utf-8?B?cTNwbVN1S2RqeTgvM2dMZXJWNzcyaElyQ0lYaDVpQmpERUVTbUtuMndvWUV4?=
 =?utf-8?B?Ymd5bWcrRmNwb0EyYWFBM2F0aVZVOEplcjBOOE1adnlsc1BPMFZBSWp2YVBL?=
 =?utf-8?B?VFZvb1NOcDYvbjYraFJ3YTJOL3c1dzFESnhOdTg1L3VxZ2ZEWFBPOGhSc2Ex?=
 =?utf-8?B?bVVUd0NkSkRCbmhrQUxwVXFZRm55dGcyVFBRbkEwTzZ4RHRpeXR3bWxmVDZU?=
 =?utf-8?B?SGlrVkUzRXpCWGFvWTdoQkxvQmhpdHBXc1Z0ZFNiWHBZWmhvOVpHb3hnNHVV?=
 =?utf-8?B?QklyR3BETVBOUldBRzZEeGF6L3hGMGF6L2lqM2djTWtVZ3doZU91bllZNXR6?=
 =?utf-8?B?RVJ2UU93RUJ5Y1ZDSkNVVkszOE9RdzNXeUZ1cFp3Sm15YlJqNDRLUm1MVjJy?=
 =?utf-8?Q?iFYg=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB12038.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(10070799003)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?eDIvK1RjYUtQd3ArVG9uTkxFNEpmb2ZSZVBUaGp6QldyYkxCa1U4ckdYNmI1?=
 =?utf-8?B?NmVLZ0F1UC8wcmcyQzM4QVZzUkdYZi9CQ2VIYzhhVXFUUVRkUGJtY25RTW8y?=
 =?utf-8?B?c1FGV3Jqb3FRbVMwMGU5TlQ0dmRZUEh6bVFoSmoxV1lDOE8rbjNxSnIvcHFL?=
 =?utf-8?B?QnFmdXpJTlJsQWNPc1ZSM1gwSWlURng3TFpzcnFVT2grYklHTGp4Q0JIS2gv?=
 =?utf-8?B?UGYxM2FGVGc3VWgwVVM2cnQ0S1BpV01UaHBETnNvWkZQeU53M3hreWtTSlRk?=
 =?utf-8?B?QWdRWjQzK0wwZXJGVndHQ0FzWTlveVdvaHlsdzNtbVlNZ0hDMUxlSnpyZW0v?=
 =?utf-8?B?ejBuQWt5WjNGVkdZTmtwRnFBRGZKaFFhNXVPTVZ0djU4eEEwSU9MenZKSnl0?=
 =?utf-8?B?djQ1YSs2WHBoK1ZNWnh4V1g1c0trNW1sK1kvZzJhMDk5c254UjdNdnYyNjhI?=
 =?utf-8?B?eVFwUGFkMW5LVEVUcUdKb2M0NS9TMWdIUzFtb3dGQmlEcWp4VWlJNTJGL1V0?=
 =?utf-8?B?K1FyRFZxTFkvOUxWb0JxWFgvVkxvMUowRUxRL1VuOUFtb2dCWm9GT2Y2NEY5?=
 =?utf-8?B?SkxuTHlqdTdaVEVzZWZRMHlMbzZ6Y3VzclkzeitINWtKNEdSVHNjMXBvRU5L?=
 =?utf-8?B?UWhlMzVhL21oMUFsUkluZDg4ZzNRSmRVUUNrWkhvUXFHeXBxS0s2K0tsU2pR?=
 =?utf-8?B?aTdUN2thOXVzbkxIVUtEcW52a0E3WFlIS2ZIWlU0SWlnV20rb3QyNlI3WHdj?=
 =?utf-8?B?czNKK0NneXlReG1Samo1Qkk5c0kyQmdZU3JTdm9MUy84SmVSVzhtUDBSUkht?=
 =?utf-8?B?d1c2NWNPWER2Slo4aG1KWmhvckhxZStuSHhNMHhwek44VjJybExabTcxRlo5?=
 =?utf-8?B?S0xXMWpwU1c4bmYwRVFuMGhJNjM0WGFMR1Z4WHpUaTlPdEJtdXFDZlM1THQ2?=
 =?utf-8?B?ZnFzRm1FMGRnSVA5TWMxcFVHckwzVi96WDlMc0tHRnQ3SkN6TitjMG0wbnRS?=
 =?utf-8?B?Nk4rV3J1aU01UmExQ3NoeHg0aDU3cEZ0eE52Uy80d2t0cnpVTEVrdGh4QWZa?=
 =?utf-8?B?ZFVBclY5blNXL21EN2Vud1pOOTZpd1FDNE5INXVwNnJ6aU1EQ2RObFJMNmtR?=
 =?utf-8?B?UTJOZVFWWHBNb1d2am9NYlBjN25EOWNETlFmdzJIdGZJWktPV05scW93TG02?=
 =?utf-8?B?bFRTQ0c3clRXSjVkclJ1NkhhVlZHeW5zRHFsVVlnYzVLR0pUTFVtUDZ1ODFo?=
 =?utf-8?B?MFRkUUVLck9YNkRUVUZJR1ZydjVWWFJjRVFZREZaZm1zN1d3SUVEdGpVcDRI?=
 =?utf-8?B?blBsbmFFYlBXVWJuNEYzQzVVbWNJNnp3dGFPZjVHY01kZE5nNEo1VTRuYUps?=
 =?utf-8?B?THdQU1RLWmFJVFlCaG5pajRRRlNSZWtwV1llSWJFOSthTVlWTWlCZXZoVEVt?=
 =?utf-8?B?RG5lUTI4akJtanhKb21jNmlEVkhVaVo0Qnc3a3hLQXJQKytKN2tYT3hkb0ZX?=
 =?utf-8?B?Qi9sTUN3Vi9jeGFQdUc3eWxBWGdqbzBTNmU2d2VoRHRHc1ZJZ2hVYTlka0pn?=
 =?utf-8?B?TXRCbERtdUlxYWNKVHRTb3lEOU1zZzZvQlR1NDFQNkIxYWlUbHMxTURlSVZv?=
 =?utf-8?B?aTZxaVJGL3VWa1VpWE4xUEZyWDRUZ0ViRmFucnYxMVF3K1lVS1daOUtqd1hl?=
 =?utf-8?B?Ykc3cDVkbFFnV3VkbitncVRHd3RPRXpxbk0zaGZpbEtzV2lZMUs4T3RNS1E3?=
 =?utf-8?B?OFNHc083NXljV2xBczR5TDVnZHhUTXAzVCt3b2FHSDlMVHhoWm5RUkg3YU1o?=
 =?utf-8?B?SjJ4WitNRDVlQkdFUW5qZ2RhK2N0a3plbUg5aGV6SEkzQUdpRzJYMEdsYU1Y?=
 =?utf-8?B?TmFZUFNXeWc0cnNoUDVkblZHVy9wdnhTdkt6ZGNrbzBCQVd3MUo3RnVTVE9U?=
 =?utf-8?B?VHpPbVk3WWhWWEx5YkNlZDJUWXprRzFTSnF6Y256b01vNXVFcVZyb3Z3VmtV?=
 =?utf-8?B?NXhONCt4SDZGVG14SHo4TUxNRXFSOTI4bFUvL2RaNE1WNGUvQlhUTzdSM0Fh?=
 =?utf-8?B?TGFlWFpzRXgyK3VDWEU5U0gvZzE3cy9SWE04MjNEcGg1NGJEMTNmYmtGeUtW?=
 =?utf-8?B?ZVA4ankwSHJHbGhnK09VUnMrNE5lQ1VxcFpKemhEVW5ybjlzSjU4R1RSU1h0?=
 =?utf-8?B?NGN6VWJNNjB6YkxoOU9FeXorREUzZUdUb2ZKSVNnSHJvY0ZYYjIwSmtzOHRK?=
 =?utf-8?B?VXhsY0ZWWml0Z2RQY1hjVitEcUhFdktQS3ZUTFMzUCtGeHRrUHlGUGRUeGQv?=
 =?utf-8?B?aDYwUVJIbm9samlxNGtmcitDeWdlNC9yU21rZkgzZnV1YzFXZGpKRXl5Y2cv?=
 =?utf-8?Q?lll9SSiXU2tuuYGXNNnU2ex5M9UuEIfS2JH3K?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 8a6a24da-05c7-4b34-d7e8-08de5e75bd0c
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB12038.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jan 2026 14:01:31.1541
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UEQgWB4JDHJul+Rq2q9CccDIFkj/bv81Q/6pWCmijAF4Oekn514jTHzEnFITfl0+KVa2lznHdhayVzNwH3NbG/Hf461gEFH1MXw+eC8x1NI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR04MB11962
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 28 Jan 2026 14:01:43 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8766

Hi Antonin,

On 1/27/26 9:19 AM, Antonin Godard via lists.yoctoproject.org wrote:
> Refresh the document now that the Poky repository is obsolete.
> 

Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>

Thanks!
Quentin

