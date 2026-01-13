Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA525D0C84A
	for <webhook@archiver.kernel.org>; Tue, 13 Jan 2026 10:38:11 +0000 (UTC)
Received: from AM0PR83CU005.outbound.protection.outlook.com (AM0PR83CU005.outbound.protection.outlook.com [52.101.69.44])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.56271.1768300682694494819
 for <docs@lists.yoctoproject.org>;
 Tue, 13 Jan 2026 02:38:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=EQ5+1GJg;
 spf=pass (domain: cherry.de, ip: 52.101.69.44, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Zs8xxEtC1Ge4mVKc0L35IyErHSdUmGIv3CAn+eHIoDkrFNdtAhzBvA1wpXfUAaUM+/FHC2oxgK/viSJRNbPa2sqq2Ci0BkWhEJ6vsKgHaJIQZzNdqQdITPD9d/KDUq0W5f57+qx0kmZRLkNqFh9OoNTX1rd2esZxXaJdMWQkereSYMbma5mnI9IGsoXR7oWL7MSyZHdFfZL3Yho6Y6YANPvXUHkfdZue4SLwYoWpYE0DaPgZQUDFvs1jhDW+a10iHlc5SEDgPWd9R7mHvgIPGu+M4/MXACXsttxBO2eUJH3MGyWp3B2y97UE3zXJ9MAuUoVI1ncOJ0HNxOPC8Vvq0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nJbs6DJyxQxyu1xA2Vn2OYlHh949HcCTB/+iMa4P/D4=;
 b=Xlgv+JVNmZ4DBqnJPe312p56O13a/JBPG5sdkZncgAEgBeqbGXiNEQx9H4jRXbT1xaXMQ0EExnFGA4EKU7PpUzCSOa364fAqWxskdZthcX0sXxfwlRs8Amz6AnDGHpksmSa0t7aPAAkjZhv3dVa4UDm3fgYM4HRcXStkFUuDMglqmmZfX0tpshkPe1nR1Y0d9Tju7HbhyPCaG525vD7BaWXkKzWxMz56RHm/MbsIh13ZH8ajjCS19kWLwRW1ZnCwIA+CkwUvP2MNC11CBGdX+dPhaTfySRw7oHEiVMqolthiZ1M1ofd1O6EwPNigqbKHLsZZxjo1mNUF7PQNFEsdTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nJbs6DJyxQxyu1xA2Vn2OYlHh949HcCTB/+iMa4P/D4=;
 b=EQ5+1GJgBh3BEDlb+qXEj1gL1EqOmmHzyGJwhWQqLPOMGJBtPF9vinS+MPjpfhr+yRzoywLTQ1OGR9Wkh6Vur3wb6El1bYqwF/VSJYVluXqjKwuqJJI+IVtxoYobHtmwkINjk8+LD7lzjhidJT5mGWOK0Jdp1IZfUJP2xyTwOrc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com (2603:10a6:150:2be::5)
 by GV2PR04MB12216.eurprd04.prod.outlook.com (2603:10a6:150:336::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.7; Tue, 13 Jan
 2026 10:37:57 +0000
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::1033:5a9a:dc18:dad]) by GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::1033:5a9a:dc18:dad%4]) with mapi id 15.20.9499.005; Tue, 13 Jan 2026
 10:37:57 +0000
Message-ID: <ba31ea3b-08ea-4a6b-aeee-2f84bd97fbad@cherry.de>
Date: Tue, 13 Jan 2026 11:37:37 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] why is "configuration fragments" in monospaced font?
To: Antonin Godard <antonin.godard@bootlin.com>,
 "Robert P. J. Day" <rpjday@crashcourse.ca>
Cc: YP docs mailing list <docs@lists.yoctoproject.org>
References: <7dbf2502-1403-3451-ea27-45aeae758032@crashcourse.ca>
 <4c7492bc-177f-4bb4-a8f4-cc19323fd242@cherry.de>
 <d59faeb3-8e61-7023-cc26-3918de5f0ab0@crashcourse.ca>
 <e118a38e-0e45-49f2-9010-01c1a4d7d1ad@cherry.de>
 <21105206-6e15-da26-2da0-de604fc4c905@crashcourse.ca>
 <f98abd3b-78da-4d20-886a-a08284d88641@cherry.de>
 <c72f1d20-7006-e705-8674-12133dfcd1db@crashcourse.ca>
 <DFNE3LZGWR7Z.296DD6XD8Y4ZK@bootlin.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <DFNE3LZGWR7Z.296DD6XD8Y4ZK@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: FR3P281CA0167.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a0::6) To GVXPR04MB12038.eurprd04.prod.outlook.com
 (2603:10a6:150:2be::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR04MB12038:EE_|GV2PR04MB12216:EE_
X-MS-Office365-Filtering-Correlation-Id: d54be0d8-cba4-4253-132e-08de528fd0f1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?czlpSzBpVmdubjJNdFNiWWR3UVRIZHh3aGZhTjhMVGJBQjA2ajhpU3UrN3B2?=
 =?utf-8?B?K21WQlVGZFIvK1g4ZHlIaEpoc2NIMU83Z21jWWZZNVB4SnFtTFlEZ29GS2V3?=
 =?utf-8?B?RDA0czF0VDVVYnA2OGl1OWpZZU00R3l2QWNIQjZVR0xia1RNdmRVdEgvOTZP?=
 =?utf-8?B?aEozVC9WZURGTDlBWDcwMW9EWlFET2ZiQXlWUk5kL2xKc1NaZThSWHVXd1Fk?=
 =?utf-8?B?c3p2WkZlWTZNWlFoODViY1RYZEJ5UmVCWThkWnFHL3FjZVd0YUFleHg4RDVP?=
 =?utf-8?B?Zk5QdWlXcmxXOG9qaFdtMGFOYk1KODRoVHptSEVxQ09JVXQ4SEFXdEo4SGRG?=
 =?utf-8?B?WUU1UXVhbzNNeDR6T0tpdlFXR3RwRGlDb1c0NVRXSXF6bWdqVFR5RUxjd05Z?=
 =?utf-8?B?d2MxVVM0RmJWVnMyaWE0M1g0N041emZjeHQvQkdhNUNaUUJMcUw4RmZHMnZq?=
 =?utf-8?B?NlMrb1FpLzRQUm9lQnFyMTFpVWRRZU9iL2djQVYvTkhZM0tLZG1PdVZlcDRx?=
 =?utf-8?B?OUp0NmdQdXFnd0pNNTNLYSswUUxVb2ZjS0E2SFBRbFo4MVpZckF4Zy9FeGhB?=
 =?utf-8?B?ZjdxazlyZzUyY25pWVVGckpmMTY5Ujc5WXViOVVCL04rTE15SXRqVVM3aTVl?=
 =?utf-8?B?YnJVbmt5ditDZ21mTXBSdi9zekV2bUxxRnB0a3lwTlovU1FwZ1RVYVh6eFRW?=
 =?utf-8?B?M0hjaCt3ZU55UGZRbXVRUEh0c1QzN01RY3I4TUphekdlS1plSXZCT2NpWFp2?=
 =?utf-8?B?L0dSR3RXTnFrSi9kMTJITFJUT2dDRUFONm50YTk0VjNJVk4yV0NocEdDOWRF?=
 =?utf-8?B?L1VjTTl6WW1nRUZ1MzBubVE4SWgvZE54N3Rpbnp2Uld3T3pmRnZIVVVQTHRN?=
 =?utf-8?B?UHpWNFljY2Rlcy91VU5BdVFpd3VpTjBOc2tjQ3VEMk9TbTE3Qi9sNDZEL2Nn?=
 =?utf-8?B?KzNhR1lwTURFTEJQc1lRK1JTeFRKUGpzamVlSHV4RkpTL3RYYTBpaWtUN3N3?=
 =?utf-8?B?YUlZQUVKVDhtY2k1c04vUGNpR0dldnJNZTlKZXNldXR5UFJEYlFGUjg5ajQz?=
 =?utf-8?B?N1dhUHVlQnpxTzdQdEdJa0dhMGhkZjkyVWVDZm9tVm9UQzE2ejJ6M2VYSnBY?=
 =?utf-8?B?aFlVMDJ2SGtZNTU1YkxqU25MVy9PVGU4VjJWMEFOcjlnMFAwYzlhbzhJWTZI?=
 =?utf-8?B?aXplQ2dNaTlmazlaWFpiOTBJTEd5MDJibGUydHh6YnNaTDlZRTY1R0E1dTh1?=
 =?utf-8?B?dUF3S1dyQVVBR21Hb0txZmphcWlqcnl0Q2RyVnYwUHp6TjBYcnRaalpKanJl?=
 =?utf-8?B?S2RoZWVSSUJKYlowVTZUMVRXZWEybUZIT3Q1TG4vQ01IQWxJOUxXTXN2dDlV?=
 =?utf-8?B?S0tDeUVycmt0NnZrLzFqemZsdmpvTUExK3VRVGo5MlZUb3h1WFhRVHd4U2lI?=
 =?utf-8?B?MXlZRUtjeTBGOHpCYzA0V1VjK0FLZ09kanhLM1BiUUpId01udzU0ZDYvYlAy?=
 =?utf-8?B?ekUwV2lJcGVSamFnMXEvemkwNm9oc3EyUWpDOWtVZUlGUi9QbGo2bXpKOWxn?=
 =?utf-8?B?ZWVNTmpuVEpndWtxR1p6WWFtRUFDNkVnRk5wMDAyekJUZ3YxOHhieGxtbmlW?=
 =?utf-8?B?YkVnR1FxSzVMeUVpNHB6OTZkbGdnMGYvSk42RFEwWlFSdkY4dXBBQ2Riek1Y?=
 =?utf-8?B?SU9WcStXaklJckgyeXhXTWQveW5MSEpjdkFqTk9rWklrS2ZCYk9RdWFxNDZq?=
 =?utf-8?B?TWpSSHVhcXRMNlM4VFRVQ1Y2Qi9IN2U0UWx4MXpHdlJ2TCtuc2ZVSWFKZFZ1?=
 =?utf-8?B?dFo1Zis5QWVUWGErSGYzVWsvbVA2Um5BUXluMmNqREx3MmhxcDloWnpRYXk2?=
 =?utf-8?B?NWNlYVpnOW42K3RZOGFZeTdrTVB1UmdoWjBIR3cvTFdaN3c9PQ==?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB12038.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?QlU3dFpWNEpmWWYxWWZ5ZlpVdDR3SUVha2E3a2RpNm44TW9FQ0JoaVkvb2xl?=
 =?utf-8?B?S01ZUVhLT3U5bEZDS3lmZlJnYzdGOEhQcmdBclkwOUlNQUlkNGdkSmEzSDA5?=
 =?utf-8?B?V2lkT0lRNE5jMnZOemJXVVNObGNLSkEray9oMWdTaWthVGJpclU4cExBZXBL?=
 =?utf-8?B?VE1kQktveU9TQTRpRnFYRTIzZXkzQnNuRW52Zm96Zk5xT0ZPMnN3TWpQcmN6?=
 =?utf-8?B?VmJsUnVMeURtV0tRZ1IzbXVjemdyR2kxdEtCRG94RzdqdlpGWTFoZVIxQmdO?=
 =?utf-8?B?a290WUttbkhvRERtbnh5a0dFQjZ5SGxiV3pET0ZqZFRSVVRJUnN6KzdxTW1F?=
 =?utf-8?B?Q1lmenJLQUMzRjJ5S1F6WE1ERWc0eUVBMVJjT3lNUFVzQzJDWDdxeE1QM0V0?=
 =?utf-8?B?MzlEdU1nNE1jRzlKa2xiVkwvZ0V0Z2lCbHFJaTlPN0NJTEN5ZHBMMnpjZXhT?=
 =?utf-8?B?dE93a2toajlFd3NxekVUcDFWUXBkUi9vazM5elBMSG1EeEpBaXlDeXhiT2c1?=
 =?utf-8?B?d0c4U2ZMTXRnaFNib1YzdnlTZUVRL0FudFpvOE0wQjY2WGl4aTgwUmFpUnZP?=
 =?utf-8?B?d0lxeU9DVi9JeHpLczhhajMxNmw2bGptMkZ5cHpPeVdCQmZlR0lmbnQ3YWRx?=
 =?utf-8?B?S1ZVSENxeGxBQlgvUEc3YTFjdThST2lUekFWeVN3UUtYdnpCQUpaWVJnWU1p?=
 =?utf-8?B?WUt1VHU0SE5NN0l5ZEYyUTBvWDUwck1wRGY1OEFoNC83VElMaDU4M1pId0wy?=
 =?utf-8?B?QytIcTIwMDN5WWxxSW1ISE9pUml5Z3JtbkJuUkxjc0RrOGdRV1Jwa09Iakl4?=
 =?utf-8?B?ZWJ3V0hDNCsvK0xhZmF0R2FjMTdZNXZQQ1ZzbEtyM04zNVg3UFpTakoyaEFV?=
 =?utf-8?B?YmUvc2FVeUJXMmt3Q0pqc0ljWEgrZlQzaWhIRFVGZ0tyYmN6azBkRzFMRVMy?=
 =?utf-8?B?dE50SmlyTTdYVlhMRHZBN0ZhRmlzSEJVcEhwQTVvWE1meWVJbVNydWw3V1BN?=
 =?utf-8?B?WlIyNlpUcGlLNStNUVd3TTUxWkxrc1NWb1RSYlJBZ2ZMOUJaVHlUZzUwSW5l?=
 =?utf-8?B?RUE0M3NTN0F4SnJWUHJ3YnI1WlBpL2FyWTlmdkFGZ3hFWERKcHFIWVpONHFS?=
 =?utf-8?B?bmllUkpVcUZjWnA3V1JObnorUUZYR05iS2l5YnVpOHg4WU51WWQvb09tOXZH?=
 =?utf-8?B?WHVsaHpBb1lBUFZqbnhmS3oxU3ZEZ0NwMnR6U3MvcGlJNSt1NkxWc1owTjJa?=
 =?utf-8?B?QjN5cStsaWNUOGI1YVVnaHhkbEViNnM0SG9NWERFbERVc0dkZjJoZU41dGIx?=
 =?utf-8?B?ays1ZXpxQ01pNnFTdDVVaityaXNUdHpILzRwZE9YRWEwQWFqZC9FdUxyc1Rs?=
 =?utf-8?B?VUh3djVKVyt0WEJQb3ZzOC9LYWd2b3pUYnBUOXZISUFjOHEzNU05dTRjRlN2?=
 =?utf-8?B?cnZHVWJtS1dIRmNEVGZPc2hoSXlVeWR4S1lzVFM1ZlZPK2NnbWdHMkxzaW9s?=
 =?utf-8?B?cHRrdlEyM1c5WmlZalloTTN2dEVSKzdDWE9vOG5YMk5rb3lyZkZBaXo3Z0do?=
 =?utf-8?B?anpaWTZOUVV1T1dyVXNiRVdVVHlSdHlBUE93ZE4xYXdaQUNNaldtWHl6TjMv?=
 =?utf-8?B?STQ1bkJTdXlvaGVaZVMzRlQxanYzRzlrUEFMY1Z4Nnp0RUlzdTdLOVJER053?=
 =?utf-8?B?RHQxNVd4YW8vbG1XUXlKbFBRcDhMRUJMT3RSeWFQTk1aNXZMaG5XU0xRcW5H?=
 =?utf-8?B?cVZLV21kRHA4dit0ekppM1hLM0liaHQzNm5jM3AzRmZYVS8wZEtJZkJpSzRI?=
 =?utf-8?B?NVczdFhjSHRkRnJNbXdnckJicTdwc2IxaHJ6ZVdTNzZTTE9jb3NGTUJ0RzlN?=
 =?utf-8?B?ZWQ0eDhQRy81ajV1RWdqSGlMYjRNbUVYQjA2aFhhSTJsREhrRDFEOTI0U0Z3?=
 =?utf-8?B?R2JIOU5QbUxSZGtoVWlRcUx1YTI5V3VUdy9aRXVPVEtieHYrRXJRMDUvK3Jh?=
 =?utf-8?B?SWtjT0NKVDdtMmhZTEJxTGEvd3FQSkVQaFBDS1FhcFhmS1RjN3VaMDZ4eXBT?=
 =?utf-8?B?R1V6dXBjMzB5UzlsaHpmY1IxdFVPTXRLbzFSM1JKRzNJNXJhUlY0elVabDBM?=
 =?utf-8?B?T0MwRWpLQkJnL21raXVYdHdWNytCbG5iK3JjZUNMajVSVlpwNVVRM0VHNmNv?=
 =?utf-8?B?Yi94eXUvMUgrSjhDQmZOU0p1WFdySDJNa1B3RGl2R3hrTk8rMkwrZXpTN3RG?=
 =?utf-8?B?Y0l2RU9CN1RLNkl4R3J5cVN3Y1dRSlNiQTgyYlYyUWtUS0x6ZUpZQnNqVlNO?=
 =?utf-8?B?VVd5RmdtRUxmUWI0Sm5DU0dxVkxWZjhBTkpUdUsxM0pIVDg3UXNXUT09?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: d54be0d8-cba4-4253-132e-08de528fd0f1
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB12038.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2026 10:37:57.3550
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WeeXl3+RsrY4qC8xcQv4CuafdTtko2lzgA0SNpwqB+Ave3apMHaBsexF7skPzqaGC1GlXjgOdJKdJe7Y9sCuzXYNH4OiutbKt5fkSg0NfsI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR04MB12216
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 13 Jan 2026 10:38:11 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8481

Hi Antonin,

On 1/13/26 11:29 AM, Antonin Godard wrote:
> Hi,
> 
> On Mon Jan 12, 2026 at 6:57 PM CET, Robert P. J. Day wrote:
>> On Mon, 12 Jan 2026, Quentin Schulz via lists.yoctoproject.org wrote:
>>
>>>
>>>
>>> On 1/12/26 6:21 PM, Robert P. J. Day wrote:
>>>> On Mon, 12 Jan 2026, Quentin Schulz via lists.yoctoproject.org wrote:
>>>>
>>>>> Hi Robert,
>>>>>
>>>>> On 1/12/26 5:50 PM, Robert P. J. Day wrote:
>>>>>> On Mon, 12 Jan 2026, Quentin Schulz wrote:
>>>>>>
>>>>>>> Hi Robert,
>>>>>>>
>>>>>>> On 1/9/26 12:45 PM, Robert P. J. Day via lists.yoctoproject.org wrote:
>>>>>>>>
>>>>>>>>       more nitpick ... here:
>>>>>>>>
>>>>>>>> https://docs.yoctoproject.org/bitbake/bitbake-user-manual/bitbake-user-manual-metadata.html#sharing-functionality
>>>>>>>>
>>>>>>>> last line in that opening section, why is the phrase "configuration
>>>>>>>> fragments" rendered in monospaced? is that meant to be an actual
>>>>>>>
>>>>>>> So it doesn't feel left out with addfragments right after being
>>>>>>> monospaced
>>>>>>> too? More seriously, I don't know, but I wager the intent was to make
>>>>>>> the
>>>>>>> text
>>>>>>> italic as to highlight that it's a two-word term?
>>>>>>>
>>>>>>> Would you mind sending a patch for it?
>>>>>>>
>>>>>>> While at it, I think it makes sense to modify the "``addfragments``
>>>>>>> directive"
>>>>>>> part with a link to the section in the docs. Maybe another patch to
>>>>>>> send?
>>>>>>>
>>>>>>> Also, this pertains to bitbake user manual, so I think it'd make sense
>>>>>>> to
>>>>>>> add
>>>>>>> the bitbake ML when asking about bitbake-specific docs (both BB and
>>>>>>> YP-docs ML
>>>>>>> that is).
>>>>>>
>>>>>>      I notice you just posted a set of patches to fix a bunch of the
>>>>>> references, but it also seems that there are different syntaxes being
>>>>>> used for some of those references. What is the blessed way to name and
>>>>>> set references across the YP docs, and the proper way to then access
>>>>>> them? There seems to be a lack of consistency.
>>>>>>
>>>>>
>>>>> Can you write down those inconsistencies so we can discuss them?
>>>>
>>>>     let me check if i didn't just misunderstand. it might be that i was
>>>> confusing how one refers to am implicit ref associated with any
>>>> section/subsection, and the longer form associated with an explicit
>>>> ref definition.
>>>>
>>>
>>> I guess you mean
>>>
>>> :ref:`inherit_defer
>>> <ref-bitbake-user-manual-metadata-inherit-defer>`
>>>
>>> versus
>>>
>>> :ref:`inherit_defer
>>> <bitbake-user-manual/bitbake-user-manual-metadata:\`\`inherit_defer\`\`
>>> Directive>`
>>>
>>> and why we have a mix sometimes for the same cross-reference, or for different
>>> directives.
>>
>>   yup, that is exactly what i was talking about.
>>
>>> The answer is likely "we forgot/didn't know we had autosectionlabel
>>> Sphinx plugin enabled and added labels by hand". I would be for
>>> getting rid of the manual labels in favor of the autosectionlabel
>>> wherever applicable and mentioning this in some README (I believe we
>>> have standards.md in yocto-docs that would be more appropriate?).
>>>
>>> Can I interest you in sending patches to make this consistent across
>>> both BB and YP docs? (Barring Antonin disagreeing of course :) ).
>>
>>    i'll take a shot at that, won't be today, though. and let's hear
>> what antonin has to say first.
> 
> The autosectionlabel plugin works until a certain section depth, IIRC, so

https://www.sphinx-doc.org/en/master/usage/extensions/autosectionlabel.html#confval-autosectionlabel_maxdepth 
indeed but if we don't set it (we don't) then it doesn't stop at a given 
depth.

> deeply nested sections won't be automatically labeled. In that case fallback to
> custom references. And you can't really increase that level otherwise you get
> the same label multiple times in some documents, making Sphinx unhappy.
> 

How about using 
https://www.sphinx-doc.org/en/master/usage/extensions/autosectionlabel.html#confval-autosectionlabel_prefix_document 
as to avoid this issue then?

> I personally prefer a mix of both. One one hand, high-level sections are nice to
> have autolabeled. But on the other hand, a well chosen naming convention is also
> very useful. For example: if I want to reference a class by its name, I know
> I'll just have to write ":ref:`ref-classes-<name>`". Same goes for tasks and
> fragments.
> 

OK, I think Robert's point was how to know when to use which one and 
have it explained somewhere so contributors know which to use?

Cheers,
Quentin

