Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BBB13D132B8
	for <webhook@archiver.kernel.org>; Mon,  4 Nov 2024 12:22:02 +0000 (UTC)
Received: from EUR03-AM7-obe.outbound.protection.outlook.com (EUR03-AM7-obe.outbound.protection.outlook.com [40.107.105.60])
 by mx.groups.io with SMTP id smtpd.web11.56138.1730722914312900477
 for <docs@lists.yoctoproject.org>;
 Mon, 04 Nov 2024 04:21:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=FbP6aYXv;
 spf=pass (domain: cherry.de, ip: 40.107.105.60, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LKIZTi+3O4PZ59G/aamkpVY0Ppev9dJSRqUkmFFOFvr8hXrDmvltANtMz2tcvh528FFK7LoF4Z3L68NNgn69QZ1Xhs+VEIUX3xY/jtX4AI7z0cATW0z9gOjS7Of9iC9xlMaa/y+Jef+ja6NhCkWJdR1pjj/fSu+Ijkz1l+VP8SionARr4CBUtHFqe6mItg5mkj5PjSM3xMEh4RWD928RjHJ9BplzTUQGHPLbqWBTsTCT9ZN1AFLubm/O4hWAsZrffgYC+pCb904bwTs2NqoNB8IlfiCTlRhAhYrhvxdz7s3NNsfJCxrMZug8jqV2ZbMpsjebBiQHc6gZxou6VCAWvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=G9LKHmO3FNUoocOJZ0mXjtZTMfpvo5Zlot1JRNZhGvY=;
 b=l/Qnw6l1XP4PraJfB2MEgn+F7gLoKYxz6iY2Qkv7aMUhLoiv8vJJeyNfAAP08jHErEfu9/1sTMUqmYIOAnGAAR0868Xnz9gL9TNX0gQIPp/+FFYLWqpGA6ihRxP+yh5O3H7+IKa+RqlDDXdI+kICcEzt3dmRMDTlV6zt9jv3ZI0ToIPu8b/2OG8oCr4xPmjH6u8F/AODMw/PD7rZP4zQ4/JVG6sRBCXvVgp/XsPqOnY9X7yzk2HQ9RofvIDnnvx8GQp19FduHh1Ltd5GWet7NMyFZhAoaN0VCJUMX2ucmsBCsqbKitop01m3yoRiiiHuwrdg06LMCrGsFyslDQsR+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=G9LKHmO3FNUoocOJZ0mXjtZTMfpvo5Zlot1JRNZhGvY=;
 b=FbP6aYXvFNARc30rk5hJSS5SNMn4X8seHn2FiZfrLFxp67lxdJhym4KxneBwh+AJ/2IdvaVASDFU3yc+2B1mYcDFBIog46n+wqbhDW13/x9sw3qRpCk4xMKTcj4qnzutI8HBnldalrrpX0YZsw3gGeM/dV/Ckw//pIgYsg+0IHU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by PA4PR04MB9293.eurprd04.prod.outlook.com (2603:10a6:102:2a4::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.30; Mon, 4 Nov
 2024 12:21:49 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a%7]) with mapi id 15.20.8114.028; Mon, 4 Nov 2024
 12:21:49 +0000
Message-ID: <d2525b56-aba5-4ab9-a355-0ee7781f87f0@cherry.de>
Date: Mon, 4 Nov 2024 13:21:48 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH] conf.py: silence cve role already registered
To: Antonin Godard <antonin.godard@bootlin.com>, jstephan@baylibre.com,
 docs@lists.yoctoproject.org
References: <20241031-fix-cve-add-role-warning-v1-1-68e44c7e8961@baylibre.com>
 <337392e0-c192-49d0-82fe-0eaaa9d43953@cherry.de>
 <D5DCKW2IBZAC.2RML7Y7RASG@bootlin.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <D5DCKW2IBZAC.2RML7Y7RASG@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: FR4P281CA0435.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:d1::14) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|PA4PR04MB9293:EE_
X-MS-Office365-Filtering-Correlation-Id: 14b1c478-d289-4d13-4a4c-08dcfccb41b2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?cWpCc053Y1k0MER4Y1F1TDlubkNCNWQ3TWhMdFdDYnYyRXNRZTBJbVFpNDB0?=
 =?utf-8?B?ZGdkSFplVGR3QjhvWUFYbkgzMEkrQ0NiOUIrMWZhYkJvUVgvcEJrS2Y3TWZl?=
 =?utf-8?B?RWFPSjk4YUlxSWZOdDNiZld1VkJ1YXFVcElILytRNGM3VEVtQjMxQlhuRUlO?=
 =?utf-8?B?L3ViZ1JJVzlDaHMwSnhXU25MeWJEdHBzK0JZZjlNMDY1VXMwWFVFZWs0RHMy?=
 =?utf-8?B?eU1sZTJrR0NjaGszTFEzbDYzTGttMWNIUGxEK25nQVBhVDIvNmZlWTgyaEtm?=
 =?utf-8?B?VlNoazRod1FMRnpTUFljTFVCV0pPNXNUbHpTMTBSWXhUYmdzc2hGSWRYaUhG?=
 =?utf-8?B?SFAxQWtzWFBSYm9WcXVNNkVVTXplL3U4R3Z6Kyt1WU94aWFPY2NSK0JGZ3Yw?=
 =?utf-8?B?OW5NTlhWeEdDN1pOWXREYU0wWmxaQ0dCdndDenBYU21wOVpFU0RaUmpsMDBs?=
 =?utf-8?B?dEtDVnI5RExya3N2MFBmY0ljRnBSNS9mSzA5alplUW45UTZFQVRuSmZCRUxT?=
 =?utf-8?B?WU9qditBVUpGYURsTHluVmFJY1QvRXI3WHlCVzJLWnkvMVp3R3BKTWVHaU9G?=
 =?utf-8?B?Y3IyYldqZEd2b1pZSVdKZGhwWE9MNDdCWjloSk5laEhVb1UrdGtIZjFMM0la?=
 =?utf-8?B?TkxFUmxCYjB5aWorR0Y3V2k5b1YzWlRRZ2Z2N1V3ekQ0MEZKRHh3N2E2Nkxm?=
 =?utf-8?B?TlliNnRTdDhLV0d2eXNSV0cxRGk3Qm91M09CQ2RJTjVhTWlIOHlCb3oxNzk2?=
 =?utf-8?B?WmRJNkpkcDM4c0p3TkFFVGUvYmU2eWU4Y2RuWDFaUms2ZG1oVEJPQThRaWpv?=
 =?utf-8?B?aU85ZHV3UVVPM1U1UzVVYlpCNC9DYkN2UTkwUFpUcXY5dW93WG1Eay9HVjZx?=
 =?utf-8?B?eVh3Um1ra1BNQlpyYmJmdmQvR1ZpMVZYTlR0VXNhNUkrMGZJZjIyTHFySG90?=
 =?utf-8?B?UytQWnRjSGZEWGJsNFF5MWlGM3dma3hJZmdMZWE4bG9pSUI1YzRSSzdJK2tX?=
 =?utf-8?B?bE5zWkplR3RFYjBvVjJkdlVNblFvYUlSckVZSUhpNnBuM2lUQWdKQXhNK0xX?=
 =?utf-8?B?cDEzVk00cVB3RFMyQVorSSt6dFl6QmZxVWU2cnQ3MDhMQ3ZMYXAzMi9lUTJN?=
 =?utf-8?B?VHRoOVk0YjFZaGFoWms2cThwcTgyUEZwYi8wYTE2djJPRkptZU41dVd3V2Rh?=
 =?utf-8?B?RnJaRVJJUURRM2dYMVZtYlNqTHZYT0hQMHdpVmNwa05aRWxGN0ZEd1o0VjdL?=
 =?utf-8?B?cVBaR1BpdzBJUUNjR0ZWYUVYYzJhUTh0ZU5RRXlobWdndWxYMVZYZjJlbTlX?=
 =?utf-8?B?cnJGYThKS1MzeHUrTHF4c2s3ZHRsMThtZVM4Q1ZrY1NVaHpXMDUzaURDRE1w?=
 =?utf-8?B?M2RnYzBtejBDVlAzakU1bHY4dnQxMnoyQmh0S0Fxc0o0cXVNS2grMzkraEts?=
 =?utf-8?B?VmdyNjNmSUVuSjJKbFZRWWorOEFRUDFjS0VwOFpaVDBySmNianlqYlJaWER2?=
 =?utf-8?B?UXZyNTBBY3d2R0RONWUxQ01nbU5hS010K0IwVW8wVGJONSsxcE15V1R1Zm5i?=
 =?utf-8?B?SDlKOFJ3WDIwTXVTcmpxUlU2OU9US3o0WVJRREl0SE9LQXA1aVZlSDhuTkUr?=
 =?utf-8?B?NjhwS1d0Nm9SN2YwZVlDSHdJSTgrOFhKbFo2M3RXVTBuWVJRMmlFQmhLOE1z?=
 =?utf-8?B?TlRlTG1QMHlQVFVsQWN5OUtNWHVybUpYblpvTVAwd3RXRURRb2R4WUVDVlNY?=
 =?utf-8?Q?SsU6D1G2bGVsOBKigosXsTskDoHTGo8y6+Rc2dO?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8897.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?MTRSQkxmdUpJU2RIcGJuelpnQ3dhYzlSRkFKRUNYZE4xanJUbnBMVkd4blBl?=
 =?utf-8?B?V1d0TUo0T2Z0bjlBdmhGRUgxVXRWNHhHTzhIby9Fc2hjRTRDNHdFV0ExaC96?=
 =?utf-8?B?Q240UzlERWdzOEM4dUllZVVGUTNONlh1TnNFZyt1c1Zlc3F2aEYzVXJPOG5z?=
 =?utf-8?B?bkNzS2MzZjVUbWFsWjNkM0hFajdiNElMaHMyR1F5dEhuSXh5bkdYMlI5MEQw?=
 =?utf-8?B?MmhoQXBiVUZyZWVITUd6M1Qyd3pMazdvengzTzNpTW9CTi8yTXNwTGFvTVJh?=
 =?utf-8?B?VktPQ05vZGhQODdkN3A0N1lRZk50S3hpUk55YU1xT0pxbjluZjdqckNVR01Z?=
 =?utf-8?B?TFNrNjBDeCtkb1JmdHVvWkIrVHc1Y2FkdHEzdldYV3hKUyt4cDFJckFoWmpW?=
 =?utf-8?B?TzB6TmViMmhFSENtN2lZQWJSNjZwY3d5aXpQUmdvT1VLbFVGUmVZNk52N3lX?=
 =?utf-8?B?a1J2djJ3TVBVT01HcVJ4TU1ubmNEQ0hRR2V4U2xzMm9YQzdkblVEeUl2SnpO?=
 =?utf-8?B?Z0h2d1lKZjgreTJPVlVEWDJablhmYzdwYWNzNEJYWW9tS1pqMFliRjViYjN3?=
 =?utf-8?B?dVlFUXVCTTNjRERwVTMvc0gzK0RGN3lMZ3JpWDJTQlVCRktYNlZJYzFSOXZI?=
 =?utf-8?B?WmxQUUpjZW1Gc3IrZkxvWklFRzNHOTdXeGZYc3hOZXVGYy9XSWNiL3F6am8z?=
 =?utf-8?B?VHV3V3FvSmlSUSs3Z1ByZlNNejY2elpkdkVJUmtla09ITUZYYkFzSXE0Nlpp?=
 =?utf-8?B?dWd1MHVFSmVld1lGeVBxTjNUUXAyK2JEa2RndEV2RTYyTUN1VzBTRWhaemh5?=
 =?utf-8?B?Zld6VTBpV3ZzazhYOW1RbG93alA1SEdRc1lRZ3NrRXBRUHI5UTJYN1RjcklK?=
 =?utf-8?B?MEh5bERsN0luU2RlNTFzMldZMFVuMzd3cnBkdE1DbFJuK3NjQjM0MHI4a0ll?=
 =?utf-8?B?eVpScDVqZzF2RW1NSUFSVFh2N2c4bU5zY1hnQkh3UTlMQVI3UWJUa1JLSmFW?=
 =?utf-8?B?WVZiOEFzRFhZcC9XdWdnSGpaUldrOUFCNlZHR2VWK1hMRFpxMCsvc1AwaHRq?=
 =?utf-8?B?dGN2dGdCa2xYYUxyQXBxcFNqaFc5eGcvaW9oU1ZWdGlnWGpIdzdhYWQzSXFx?=
 =?utf-8?B?eWJUaVRqNEY1a1Jra0NQdml4d1UwcVV0V1ROMEcyWHpPeGJrUWVJL1hub0pS?=
 =?utf-8?B?ZnRHR1oxVVN6ZWg5b0NnWkFhSEZ5emRrSkgzWG9kV3B1dVhxRS9OUFAwYXl6?=
 =?utf-8?B?UXFyOExmNzJDVTNySlFpdHcyNnNBYzVTQlFTK0c4dVArUnMrcjhwWmQ2MVNq?=
 =?utf-8?B?Zzk5SmNuMHVPeTdkYXFqZnFyN0JMOVJNNVFnYUE2Z2hzM28rV0FxSFZzM3pZ?=
 =?utf-8?B?T2oySitJSFBLWUFLckJ2YWt0SDJ4SFBxMnlxcmlnR0E3Zjk4YVFObDI4RG1U?=
 =?utf-8?B?eEovVnhkelJ4TGpGdUJCaUNyU2dSb1lkSkF1M0pYUjFvZGswRHoyRXhLZ21x?=
 =?utf-8?B?bFdkT1VoK1BBYW9VeDZUbHFpOE0wTlY5NTQzajkyWm1WeEg0NXUwc3NBczM2?=
 =?utf-8?B?M1d1amtlYUN3ckgxejdiUXlOclpHbURtYnZwcFdOMjB4R09GeXRLeWE0QlJu?=
 =?utf-8?B?akJMTERaZFo2ZmR5RjNOd0FNTk45bEtOTm9ITWczK3k0dHh5dU1wUnd4a0hu?=
 =?utf-8?B?MHVIZ1FkeGg0U1VNSmRTQllMS2drUVpXcmUvZFZTNHYySjg0QWlMb3FoTHp5?=
 =?utf-8?B?OHBkNWN1WEE4bkMyM21GVk8rdmpXZll5ZDlaQjRvbjY5L2o3aUxBRUhWcC9m?=
 =?utf-8?B?WVVJbWNOcHYwTmJOc0hHYTlUQjRIWXBPbU5KMFgyUHdxSHpYQ1l4T250MXVu?=
 =?utf-8?B?cFBuOS9PVmhoNjZGaTNscmM4cm1aNVBMZUZGVHpDVXlDUGxQcGg3MDNJOUdD?=
 =?utf-8?B?ZXVUOVYrNzRxTEhjZlVScy96Y3grY3hhS2Z2czlQWEJHNWtDc091QlBWUXhK?=
 =?utf-8?B?ZHFCQThTTVBKRWVVODFQODNoVUMzdE55Z3dHS0hWdldMaWtlWVRJcysxNm1J?=
 =?utf-8?B?VjAyMHBkQklqZkdvbGJ1SU4zN2lUUUZGMmJ4aThZNit5NUNuM3ozTVZ3SWJV?=
 =?utf-8?B?Y1JoTlFYdzNuOE9YeG0zMk8vekw4Vmc1VXU3S3FXOXJ6eTRsVDU2UDZDTVp3?=
 =?utf-8?B?eXc9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 14b1c478-d289-4d13-4a4c-08dcfccb41b2
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2024 12:21:49.3504
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1QigkWMBTOACofk0rtJyGZwxOnDXbEja4j+SaXG1lcHBEwrFcxZadSH5YPuvmdjWQa+pO+ZlmP9qpMCJ5FU7siDXaR5sgtWiuYPCSBUWBfk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB9293
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 04 Nov 2024 12:22:02 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5652

Hi Antonin,

On 11/4/24 12:11 PM, Antonin Godard wrote:
> Hi Quentin,
> 
> On Mon Nov 4, 2024 at 11:33 AM CET, Quentin Schulz via lists.yoctoproject.org wrote:
>> Hi Julien,
>>
>> On 10/31/24 5:52 PM, Julien Stephan via lists.yoctoproject.org wrote:
>>> Commit bd9add8a0 - conf.py: add macro for Mitre CVE links
>>> added a new macro for mitre cve links called "cve_mitre" which conflicts
>>> with the already existing "cve" role.
>>>
>>>     WARNING: role 'cve' is already registered, it will be overridden [app.add_role]
>>>
>>> The warning is turned into an error making "make html" fail, but
>>> documentation is still successfully built.
>>>
>>> Since documentation is still correctly built, just suppress the warning.
>>>
>>
>> I don't understand the issue and why Sphinx complains about it.
>>
>> I'm also very wary about just silencing a warning instead of tackling it.
> 
> The issue is that newer Sphinx versions are already defining a :cve: role that
> points to cve.org, instead of the role we defined in conf.py that points to
> nvd.nist.gov. So we have different solutions:


Ah, there it is. Thanks for the explanation, this should at the very 
least be added to the commit log :)
> 
> - either override the role to make it point to nvd.nist.gov, which is a bit of a
>    hack but works:
> 
>    from sphinx.roles import CVE
>    CVE._BASE_URL ='https://nvd.nist.gov/vuln/detail/CVE-'
> 
>    Also that may not be backwards compatible. Context: we already noticed last
>    week that old releases don't build with newer versions of Sphinx, we were thus
>    planning on keeping an old Sphinx version for building old doc versions.
> 
> - just point to cve.org instead, I'm not sure how important pointing to the nist
>    database is. May pose a problem with older sphinx versions, though.
> 
> - remove the warning as Julien did. Has the advantage of being backward
>    compatible, although not nice to suppress a warning of course.
> 

- rename :cve: to :cve_nist:

Easy to backport, easy to replace with sed (s/:cve:/:cve_nist:/) no need 
to get rid of warnings or implement non-portable hacks.

I'm biased, I vote for the fourth option :)

Cheers,
Quentin

