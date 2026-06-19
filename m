Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB4BFCD4F26
	for <webhook@archiver.kernel.org>; Fri, 19 Jun 2026 14:55:55 +0000 (UTC)
Received: from MRWPR03CU001.outbound.protection.outlook.com (MRWPR03CU001.outbound.protection.outlook.com [40.107.130.63])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.44261.1781880953759796682
 for <docs@lists.yoctoproject.org>;
 Fri, 19 Jun 2026 07:55:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=WvorAWjC;
 spf=pass (domain: cherry.de, ip: 40.107.130.63, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UwoLYrgGu0d5LdK1+0ZYMkP/Jf1JTfYX2oQRRyKubHq4+izKC8LO9x747EyTeAZH0Lya9IVuv1VU/+SqvllJp3Vc53I9YVclghMjIIjJXiQEBVKOFqhhXmZl8R76I57E97X2VO31cQSL7CKA+blYlbCqiQelSnryEpoLAJuA9dd25geOQIYnISMBDkCFqbYHxzG4eBs5uGZvdgQd7wVniHBbXJEgwnfWHt+bIpkMCsGSoSjIIwcTljI7CZRNED76BHR7AeuNVRjYwTGzXpxEpdc6aJs2I+PYJD91JqumazLRX9Mwq+r/UJQWj8rc5BhYH64XbRjOjm+Oe0isdJAJ3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CIpnqaqRmyHMuhGBfNyLKWrjym9+1Zkj89JmvoT8cSw=;
 b=U4WIg7SVdxWIFzhc+47/RoXx7v1Pv6pqBX/gQNWsdjp/Rq3C9A7e3UJLySNPOk4rMpoXah6UP09kBkHtRL0uMDOGPOKXrGYGR/uAbAaKndPoWC2jrDc6U0Y2Ps7ulloviPAJ07xU6zVk0jMQdp+iDQeqMQs5Gbp53Fg0HehmrqWDvYIMb3O7ZF7VK4IxrgjjkmpoANDcuaYFLvaDBKu8CUtyvyHm3LYG24OnVOok9Zi+mwLKbfGxEK0iz8bWHp+GJsgbvz0Jmmw7JK0dsL4fZN8xAnecsDfEkr2KrfWsBd8Ehl+59IsttSMj6NYL2EqVMa1JlQCjEdgWc2nsS6wUgA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CIpnqaqRmyHMuhGBfNyLKWrjym9+1Zkj89JmvoT8cSw=;
 b=WvorAWjCqFnsUn6H/FAnP+em570teyLgF4SdN/vm5RqgKg0BzvrIdVkIOwjhWsv7OBoCF2/UzVzcN5V1d8qBnrXz10MHjq/KJknVd/GQ/JNAx7TPK3CeP1V48ImgeNPpMq/pCzvT24gsdejxUaDpW531KRTHhwxL7NPkMNVoscI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from PA4PR04MB7743.eurprd04.prod.outlook.com (2603:10a6:102:b8::20)
 by DU6PR04MB11207.eurprd04.prod.outlook.com (2603:10a6:10:5c2::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.11; Fri, 19 Jun
 2026 14:55:48 +0000
Received: from PA4PR04MB7743.eurprd04.prod.outlook.com
 ([fe80::9a4e:252f:2fd:97b7]) by PA4PR04MB7743.eurprd04.prod.outlook.com
 ([fe80::9a4e:252f:2fd:97b7%6]) with mapi id 15.21.0071.010; Fri, 19 Jun 2026
 14:55:48 +0000
Message-ID: <b24a5667-e727-4388-bae5-93bc6e6695af@cherry.de>
Date: Fri, 19 Jun 2026 16:55:47 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH] dev-manual: fix broken grammar in "Libraries"
 section
To: rpjday@crashcourse.ca, YP docs mailing list <docs@lists.yoctoproject.org>
References: <e9b3258b-c745-860c-0da8-7e3ed1f1389a@crashcourse.ca>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <e9b3258b-c745-860c-0da8-7e3ed1f1389a@crashcourse.ca>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR08CA0245.eurprd08.prod.outlook.com
 (2603:10a6:803:dc::18) To PA4PR04MB7743.eurprd04.prod.outlook.com
 (2603:10a6:102:b8::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB7743:EE_|DU6PR04MB11207:EE_
X-MS-Office365-Filtering-Correlation-Id: 83eb8779-6ed8-4f45-4b8a-08dece12d95d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|366016|23010399003|1800799024|18002099003|22082099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info: 
	H2+3HaV43osUaetglyOmv0gMcUVXWq1mXpCHEzxCtl8JjtMd9jAxARJJMcagD5O/AokYgqELicuUV8mPNmzvFAUWQMgDBklhoAKZcKnRf3UI4C4BbFoAzzuZo+7S5hLUEQ5hjXshAio6C58LytXlloknsRbW6rPKI4TvHTDzcMBKltxUCZQ/tiqFsavVJecIjL/KOn73MbjSyUQFJp4J8yUHWV5ND3M6c9BB7AnjyqddLItfThD+XGDKnvHy+QYp8PVGfra/OEZu3fKbUxAgSF+Zi4qP5m04T+98DDVhBlrhWsFZgx57XLvjHXgqMl0FpvUFBn/n6sHVZlBfn+QyVJ5imZfDq74yIO8kTb5ifW7kobq/4VcoI0cNft6/smWOA1mLFa/SSWMDGb+tXDGDXY2M00Cm8OFPqy7uAuQcOfhNmZV2xGexL1od7kRBtxCD9xCxUml8cGWdZAWnyLgdNEhYKgsTAQaRJUST1FP9Na5FLNSOWed73d64ly1aRPXitpDO0VgVmA7CjE0rOAGooOPGGwUIXab+tsi5695zWsjIsA7i9DKo5ju0OuOsmRcdYoaD7moqCiUdB5+P/E50dW3inBh4AgiQpiLqa64zXiQiN1NRtKSKaUb1y5prpNzQkcezVacIGCf0FUrmNg2k1zJ2jN2bYl4fcJ9/MO6GDps=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB7743.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(23010399003)(1800799024)(18002099003)(22082099003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?Z3dNUjZka0lHZG5wVjhWNjdmY3pGc1FQZnd0TnBZb0wwR08wQ1dhS1R6VGRv?=
 =?utf-8?B?dU14MW0rNUNWeis3aE1MQms4ZlpZbm1lN2RrOFV2djdNdHBqUXBYc1dGM1Jl?=
 =?utf-8?B?WkVBSFc0czEvTTBYNEh0Z3hGcXlXZDNsUklCTTkreERiOVNYRG5SSUI4Q1JI?=
 =?utf-8?B?VWh5aFErZGJFU1VPaEdnTGZDQzBQZlNveXR1RUJ1bGpFd0x4N2lDTTUwVEZX?=
 =?utf-8?B?b1F0MUFSZ05QQkNFWTIwek54ODFWdkdlRTFiR240d1Nua0pJUEtoUm1YekNH?=
 =?utf-8?B?WXIvVmEwT0J0Snp3S1pVYklHOUJ1U1hIWkxTUjFlajFralpZRlB5b0k2bHZO?=
 =?utf-8?B?djl1bmVxMnF2VXR1RjJwdlF4RGhlSFN6Tk1sWTgra25DMFVEWWM1RXQ0b1A4?=
 =?utf-8?B?SHRKcjY0eVNmcFFWd2N4QWhTL2NzYUFJWlFlcXRlYkpBcmc2RktZMkMrZ0tj?=
 =?utf-8?B?RHNrVFNXZEJ0VVNjU0dwTXhCSEVXa2tBY051VXgzNlBKbHg2SG1QeUxpbFRu?=
 =?utf-8?B?NThib0NDajZpZE91cEU3Sm9iTENDRkV2dk9OK1QrcXNQN2R0R2V3VFludG42?=
 =?utf-8?B?SUxuUGxzTCt0ckJKd3RFQjZzL0xJcEdlYW9CV3lVYzAvZ2dlMHhHV3RJTTJU?=
 =?utf-8?B?Ui9QdnNwcjluUDF4S0dDU1dydU5ieU1KUnZUUzNOK2M5a29zQkt4ckRGaTRG?=
 =?utf-8?B?R1lXendZZlVSKzFUYWkveXo5RWhVU2ZXYi9kZmgxdWErTFJQM3pwckdHVXNx?=
 =?utf-8?B?OHNOTnBkSkZONFBLcE4rbmxqZ2w0Z3d1dXNHRDMrNEFLbkFQWlo1UmRTNGVj?=
 =?utf-8?B?MGw0QmRkWTRNdFA0bmF6S0VWRWR0WEVpTnY2cDF0RDE2N0FUaGpGVjR1Z3NP?=
 =?utf-8?B?ZFhJTmVCdW9lbENZWElLRDVIK0w2UWVVeDY1bzNIZHo2V014bVZ6bTVmMmVS?=
 =?utf-8?B?V1Y3ZTZuYm5ucU9CbitNdUZOOFViNmQ2d29ZZEwwSGo5dWZtSWpjcDZ2d2RK?=
 =?utf-8?B?d1lURkpNWGV6ZzVkN3gvZFpyTFZ4aDE0QWNKamRYYnhJYnU1cTVrdEthRFcz?=
 =?utf-8?B?VU5hTnVsUU1QU2xBQWUyRmlsVFN3VTZDSlV2MVFEMWo0cElMbFB0ZjJxcVpO?=
 =?utf-8?B?SVVEalNnTlY3WkI1ekkzK1JEV0hHNkdxK3p0dm1vc1QyZjRLVUpzVjA4cC9V?=
 =?utf-8?B?bkZCZzlSV2doY3B5NEdnNDFQWlNKbHViVnJBaTk0b1IrVmNMa053OFMxWUpD?=
 =?utf-8?B?RTVQVHIrTU9ld2ZrMjlpTkYyYjd6ck8vWUkxMHQ3RllneDdiNWttcHpVWVdU?=
 =?utf-8?B?Y2I5Y3pMVVh3RU5URXBpSk5XRVNOczFoRUhQdlFhSlJVSURrSTdsZCtXUDNx?=
 =?utf-8?B?SjMrcnQ5endYbkVQVldleHNpNzgyMmV5Ty9ZNStVa25Nam5oUk81M3FyRHor?=
 =?utf-8?B?am81b1pHak1BRVhYU0dCWFFvWmNrc3FEbjIxKzZIVDB0UmNtaHVlRC8zSVhT?=
 =?utf-8?B?VUN6MExqcE4xSWVSMFFYSVpLQTE0SkpZaUU2b2U3SHFhSFdnbm1WaUE1YmNa?=
 =?utf-8?B?VS9IK3o4S2RucDM5ZjJOM1VkeDBIWWtnNlZKeXFIL29hS2Nzbk5Fa0V0cThJ?=
 =?utf-8?B?LzJUKzZudG1WckY5aFo5Y0VkL1d5SDZhVEV0bDEzQzBuYjBucFhBVWxNR0tm?=
 =?utf-8?B?eWxwMFB2S1FSa0h6V3hXemg3bS9mWi9GcnZvWmhBalViU1NZdVg4aERQeW9Y?=
 =?utf-8?B?eW5hOUFPbHZaY2NWNEU3VXV3SFA3TVZic1NKTDkvNnpreE1LWVlKR3pjMFlJ?=
 =?utf-8?B?RGp3cHZ1eDErZmYrTWVlRm1tRGVmRFRFNzUvY2czWm0ydDVLd3JycXRnQXA3?=
 =?utf-8?B?MzliZ2UxUEJzVk5Kc3VzUGYrVlRFcGUwK3owUDRHeVROeUYzTnRKNFF3bW0v?=
 =?utf-8?B?MDBHQ2tHbmd6ZVVEMFpCMlU5NW5VUUVNdjFTcmFUdzUvZUdFbThNZytPTjZJ?=
 =?utf-8?B?ZUM2eE5FZlAzWSt3R3hHK2pNdVBzTmZtRWU1VERNYzJVRWNSRi80WjNBVUNB?=
 =?utf-8?B?NUlhQ05ZVm1PWWFtT3pSNTdENXJPMS9pRmJzWWlQOEM0VVRMTVVwNUNFeFhS?=
 =?utf-8?B?ai9RY1NPMjZ6Smt6NUc1a0Nmbit4NVVCV2lkNDI0eWtUR0xBbE1jWXlGT0pT?=
 =?utf-8?B?dXZrT00rYmlJVkFXT1JYcGNhTXNobUw5L3JrMXZWbHlZaHBYaWpRUTRGNk16?=
 =?utf-8?B?aHZ6SEtZTGxQQmpBa21UMzNhem5tZ1NWeFJyc2RNYllpQVVzNXpsN3VESS9w?=
 =?utf-8?B?ZTVxMkR1b1VIMDhLMmROZDl6RWUrNVhOMjFsd3d1TlVjSUx1Z0F2Zz09?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 83eb8779-6ed8-4f45-4b8a-08dece12d95d
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB7743.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jun 2026 14:55:48.5976
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GZa3fZYpfSepK8GO3jliROYlNvI/r9SQ4cDWaCBR1omxVwzsRB5adOfVIXR+WDZnnISj5qzd4fu8o/8k89ytIOzaSxB6tglHShMnYfngNro=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU6PR04MB11207
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 19 Jun 2026 14:55:55 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9795

Hi Robert,

On 6/11/26 1:06 PM, Robert P. J. Day via lists.yoctoproject.org wrote:
> 

Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>

Thanks!
Quentin

