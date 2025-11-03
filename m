Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ADFC6CCFA05
	for <webhook@archiver.kernel.org>; Mon,  3 Nov 2025 10:35:39 +0000 (UTC)
Received: from PA4PR04CU001.outbound.protection.outlook.com (PA4PR04CU001.outbound.protection.outlook.com [40.107.162.48])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.17579.1762166133568330212
 for <docs@lists.yoctoproject.org>;
 Mon, 03 Nov 2025 02:35:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=RRrPi6vs;
 spf=pass (domain: cherry.de, ip: 40.107.162.48, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=U9BlqYYPGP8MaNTio49gIsL9C2H+ykNZlaLYsrlzTo9hzT7OC5HU3XJKPTck/1cP67K3EJb+iideWl552+/WLfoEdpP9GjeU4ZBLISHGrfgMh7NFVibzpiNtApdms5vUQUpUJsLxsHeYY6EKLVyIV5AF6LBkuMH92ag9HMvR4c7JfCgkKS6VY/6bTr/Evv4iLhdFUq6tmSIaA2UEghYBpoPPlU4R9lZk6GKDnzFen8PTvyCN1/oTe5Dn/lK/kIsdX1re37Z4S6Kfc6f/qQH4gMTVFlP4TXwG8noE709551YtAcC8AKb8rHD6seBMTwGS4PF/QlGPg+uraQQowk+AQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dYyatkwxie7EIUBpzmnott86VeOjdR0xq31gJF+un28=;
 b=M9PmzgG/RvnuCkV/HwGA8QWDvFBUAyE2fIIMPhBqjULayde/8pynHaTCFls0igN3YZZhjDonU5Z6VzhkyRh9j0KRG09nKxavk8HKhfLIZIUMsX+/PgC8NN2bz3DNTgw5h9s37m8t0D6eIRvnq3MLeFZgBOu7yaybQ2OpcYV/u0lVftSoBWo6NESJhuQCVCAlR38RfRAYpb7LtZ5OleYc33ah66AaXdezG4QKgWfLU3bA+3RvatdFiFoJBTveKFtHdmKTOW77Jh1HqN9Mzy9joMQewXVaRQ+7DC89otrekclVXW5D4yGq4x2oBkyDLP/rKyusxyuxrcFwnjbHHJR4Dw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dYyatkwxie7EIUBpzmnott86VeOjdR0xq31gJF+un28=;
 b=RRrPi6vsV5D2hezrSebNe/U8UV4wvu9ux88X0dIuTJf8KZuv9QrZVobyiLtO3TrL84OyeYN9uo9YrGNkdpSs70q4L9nYHUwFqWe5iIZ83UCpmORZnZ+nrEAYKNpIy9d4W2qo4n5/p1BkdicAmel30bcle84o+dOvNBBhcxeAjcs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by AM9PR04MB8716.eurprd04.prod.outlook.com (2603:10a6:20b:43f::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.16; Mon, 3 Nov
 2025 10:35:29 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::5ee:7297:93b4:a8d1]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::5ee:7297:93b4:a8d1%6]) with mapi id 15.20.9275.013; Mon, 3 Nov 2025
 10:35:29 +0000
Message-ID: <da496ad1-f622-4266-9608-d890f99fb4e1@cherry.de>
Date: Mon, 3 Nov 2025 11:35:28 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] out-of-date definition of WORKDIR in dev manual?
To: rpjday@crashcourse.ca, YP docs mailing list <docs@lists.yoctoproject.org>
References: <9c98c5d1-a78f-7b03-cd5d-8481d26529e8@crashcourse.ca>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <9c98c5d1-a78f-7b03-cd5d-8481d26529e8@crashcourse.ca>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: BE1P281CA0136.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:7c::6) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|AM9PR04MB8716:EE_
X-MS-Office365-Filtering-Correlation-Id: 599a0097-580d-439f-f9f9-08de1ac4b51d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?QkV0bThxajJLUFg3cThHeURWakFUTDgvWVRxWU1yRmhyQ0VBT2gxWSt0TmE1?=
 =?utf-8?B?VXBFeEx0OVJ5V0F4OVg3dWZwNlRvQ1puNkNOUmtVOVFVM3g5cFNtOWdOQWll?=
 =?utf-8?B?N3FSbjJyVDQ1N1RIaXhwc2ZtOWY1WmZuV3hXTFBJRHdGMC9vc1dnSVY2SGRG?=
 =?utf-8?B?ZzY4alNDMUZ5QnNQSWkwWkpkNnBpU1kwajE2WWhqOU15T0dnY2JxZ1lWVlJK?=
 =?utf-8?B?YXJWMGtyZFQwNmd2Zk1qZ1Y5OWNqTy9ob0x5eFRsOVZvMFgrd0NSSXVITUR0?=
 =?utf-8?B?ZUhBQkN6YktqY2JFWUx3NXNkLzB0Q3E0enN3bWZPcHY1ZzNBWnUrYVVNN1VX?=
 =?utf-8?B?NUFWQkRsNWJSVXNQR3lkdEZaZU1CM1oyOFJEOVdEZ1Mvd3BZZnpwSWVRd2xx?=
 =?utf-8?B?TWQveElzQk9QQ2p1VTVLdlBib0JCem5rUkRRUCs5V0NhTGFnTWNicXJNaGh1?=
 =?utf-8?B?MmJGdHFPejNnVzN1T1Y4VXBzZFlBeUJ6c1VJQmlSNWF2VW84MjIrQlN4ajlQ?=
 =?utf-8?B?cWg5d3BBNWRiWHYyZ2pvL3BoaGRlNjN6b2Y4cER5VjR4WWpVTFRScVZsVWRQ?=
 =?utf-8?B?YjRKaGkvdGJyeHBXUXJ0WHc3TGRTdVN2MXdXZC9mZTd6SjZRY0NEYktEcC9z?=
 =?utf-8?B?V01tc2ZRNHdUcnB5K2UxeVc4UHh3VEdmYU9VUDJ2ZHJMaWJtdXlwSnZBYVhl?=
 =?utf-8?B?alhsSlV5b2pYV2hPZlFPenJYaEZ3QTVCMnlqUnJhSWcvMWJzYTZ0b0gzTGlp?=
 =?utf-8?B?blltL1pNMyt2dFBRQ25WSCs5dzcvcmZKcjhyRGdPRWJuZXlpR2VFRjY2WGQr?=
 =?utf-8?B?NkNtN2N3a2pNMWk2b2pNeU9KVUlFVm5HZEZxeFkyTUZsQXBEeUVJR0NyV2o4?=
 =?utf-8?B?aHYwQU9GS0o1TVZkVGNHYzJyVUFtZU1GZ2pZSkRqRzQzWUR4ZDZYUitNaUo4?=
 =?utf-8?B?S1RYVmJGQjVCTEYwdE83UkpZcHNaVys2MFdPaklnbHYzcGpnVHIyVkxPMi9E?=
 =?utf-8?B?alh2Q3FBeUNJOUJDd1ZNL01ocVl2VysycW04TUI4SkhwWVc0emMrK3lFUktZ?=
 =?utf-8?B?aXpZL3J1N3lKdUdXckkwOW9EWXl5dkRjUzk5Q2NtK25uVGFWYVBQQnBNdGRT?=
 =?utf-8?B?eXVWNTVGamJtWTJtSURBUVh2MmRMNUk3cGk5LzNncUljU0c2Z25zV3ViWGhP?=
 =?utf-8?B?enBRU0lFd0tYbXlVTEcrb3NLcWZ3bTUrcHpIU0pSZFJRUmV6ZjNYZlgyUmlM?=
 =?utf-8?B?MTBjMi9qc3RFTW9sbTRTc0VrWVN1M0Nxc2c0NWE1c0tFcVNJK2lhbzhCTFZu?=
 =?utf-8?B?SjZQZC9nT01xTFAzbkJ6d3hyN1BBQVMwUWdQajg3aEwyYzEySStmYmlmL1ZW?=
 =?utf-8?B?NkF2d3FEYVVLZWsyRGtVNkxSQnhwK3VNblZXV1pOVXNMcSs2WmRTL0tNTC80?=
 =?utf-8?B?WFV3MkNyS2QweE9qQ3FnNkdtTGNnclFvelg4aUhUYytCdWVGS2NGWVJ1b2NM?=
 =?utf-8?B?aFN1YTdpUVBRN3FEdTA1SzIxN0xuY05FSUloK2hZRTVUN1lVRU11QnZJOURM?=
 =?utf-8?B?WCtIL3dva1JINEUxUjVmekhmMU9abXVLSDJsKzhhVytnR29HMWZ0eGdxVkhN?=
 =?utf-8?B?bmtjc2tkUG9CRFRNTk0wWVRueFNjNTJFemkzbkVwdjlNbUxoM2QrM1MxVVA1?=
 =?utf-8?B?UUF4VzVOSktyL3RsQUk3QzJaQlI1bHBBNVVIeWhEak1XT09HeGxCQ3FTc2s0?=
 =?utf-8?B?eE42U3VMUkh2eW4xNVlWZk5JaVZvMzFxS0R4YVYwZGJEaHBlWlRVYm5DU0FP?=
 =?utf-8?B?NUx3QzlLQkxlemdpdExYbzQ0ZXAzY2FCQVpnV2oyREpZVTlrOFRnMXd1UlBn?=
 =?utf-8?B?cWdFQkc1NmVRenpFbk10bXhLOUFEK1lMUUFvcGhqL2gxa3c9PQ==?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8897.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?QWwvaElIVHhoUy84TERhUjFxUkpWanl0aE5DRjNHQkMva2pTNDJtc3NGRWxQ?=
 =?utf-8?B?YzJ2dEhnbjBjSy9GS09neC9sa2pBSUV6MmVpWmR0aUlyYjJCZFJyZ3BXUXEv?=
 =?utf-8?B?WlNtNGNnSGJVWlJEZGJvUm55eUc1NFlTVHdrdlVKMUlDeURLNEpZekpod2h0?=
 =?utf-8?B?ejNneXhyRXRqcVlQMnIrS3JiU2l1eEgweUJBSnE1NjcvaFk1bm1aSE1Ia29G?=
 =?utf-8?B?cE0vTmdPSEhIc0NDbkVPcHRTV1hqVnNpMldtVVZ3Mm1kLzhXSlZOU1djaSth?=
 =?utf-8?B?VVBVcEk1WmNwUktFZkM3WGhHemxsdlV6YTR1Q25HMGJlVFZwN1pUWWhEZ3RW?=
 =?utf-8?B?OWRlVUhtMVN6OFJ0QkdNSForc29ZVWJqYS9zM2NzMTJuRTljL3JZZGl2Ky83?=
 =?utf-8?B?OThSNUduNFhrTFMvSTBUcnJNRlIvazN2MXdPVEY1RFloc0F3UVNGeUdTcGs1?=
 =?utf-8?B?Y0hNbDcwSGdHZEJoRXdWcDd5L1N0RGx6bDBtWjdYbTNNWXBNaHhTS1h2bG5o?=
 =?utf-8?B?RGZYU1Q1eDV6eXZNV0lLdm94YS9ibmZ6WTdCOGcyUXFFbnJiNGtoNEZTYzFU?=
 =?utf-8?B?ZktFUjdVYVpVU25WQUx1aFpOcllzTFg5Q3pPY0N1aitzSWhoUWRIZVdYUThw?=
 =?utf-8?B?VnYybjEvcllsellZNlV1cTdIYSthZE9tMlZ5QWdnbE5UMmNXZFYwUFlqWEZQ?=
 =?utf-8?B?T016R3hOT3E1bU5XTmRiZ2RWWlJZK3g5TmFJdENyTlIwS1l4NmpwOUNtaFlY?=
 =?utf-8?B?TnprYnJ1K0ZmWTUwemhNL3R0VktiWDhZNmhXZHhGK2tGT29HME9RQVZwTndi?=
 =?utf-8?B?Wlh1TjRDVk4zRTRIenpYWGFjbUJRR3Jtd3BNek82OXlUVEwzdnQ3Z0Y0SHdW?=
 =?utf-8?B?MkhzZmxZYVhQSU9LYkEyNWRFYW5jWW9YaDJLdjVxTnZ0TFdQb0hydkFNN2Ey?=
 =?utf-8?B?WjN2bGQwaEdYUDZCWVZzbmdYRlFlZ25udTZSUFBtaWMwZ0hzQWNPVitQYm9j?=
 =?utf-8?B?akF4NkRlOHoxY2MwK2ZRR0sxS2w3dTZhajF1N1FLNjJ5M1pkbnFEMEVvbkRE?=
 =?utf-8?B?YzJ1YkZCRFZHTkx3d1RoU2xXMTZxRy9aZWs2dWlXYXVKK1Q5TUpUYVZHRWdS?=
 =?utf-8?B?cTl0dXNwRlc5REdLd0xwdHNMdzFndEJBVDg1YTBIM1BtcGg4NElNVUxrOHFq?=
 =?utf-8?B?dTJFRlB5WkFwV3pPZTI4M0gxMnpnYmNjTHNiS2J6S2E5d011UC9oMVgyUzFh?=
 =?utf-8?B?Sk1LS213SEJIY1F0M0dhL1Nya1RWQWRLL2dXUXZ5VjlNNVZUTWIrQjdSK00r?=
 =?utf-8?B?bDYwQkdXV04xN1hPOExZdjE5N1llNnoxWGJlVFppQy9NUFpERlRIQ0M5U2FQ?=
 =?utf-8?B?TjUyeVRkVTBVV2kvaUtyY0JIMkdQbCtrWWg4WnBlMG1EN09GUThPelgxK1Zh?=
 =?utf-8?B?NWRSaVE1cmFIQlZVMG9OTDlZVTMyM25teGJNOGIvRDg0RXcxYlJaYlJTb2xW?=
 =?utf-8?B?bjUvNi9vTnlIMUY1eGRQQXlRQklUSDNYYXBnQkl3SVMwb0UvZ01obmoyVHQv?=
 =?utf-8?B?ZERvRk93L3QyZFdZZXJDQnVXekVsdDc0LzE3UERzTmFRY05yZ2xvUEhBenFP?=
 =?utf-8?B?S3d3bUxCT0JoUVhwUDI5R0VnbFBJSU9wUUVNdU90ekx5VzYwRjh3M29ycEVl?=
 =?utf-8?B?VHZYaFRBbUZySjFYZUg4WE4ybWVlREt5MnBUUTJEN2xOb1hub1RlOGplNDVv?=
 =?utf-8?B?aE1vV3NiMkVvMEJkQkdTSUIyYWtsMWlWRlkvZkNXR203Q0Z6WDdCVWRzS243?=
 =?utf-8?B?UWtMcWhKTmliQ0FpSFhEbGE1WnlqaUh4d0h4U203VzdsRWpIOEcxbE1pNzhO?=
 =?utf-8?B?YzBWaEhkRnlyd3lXNmpBV3lUZzlweW9RTHNVaVo3V0UyZVl5QUsreDAwVWc4?=
 =?utf-8?B?OHAvSmRLWWpMdkV1djAvZjRuWDJzYnljSW9WYmRGaEJmRmwyZFNlSDZnYnZQ?=
 =?utf-8?B?bkMwSlJ2MG1ISFNTUWxHc2t1RHJKa3Z3b3NOUWMySFpSZmordHFIdENNVWRX?=
 =?utf-8?B?dlZNdUl2Z1I4ZXhlQ3VEQTE1SmdjRGdjOFFGazI3ckMzejgraHI5ajlVYXp3?=
 =?utf-8?B?NGtJQk9hQVN2VmJYS1hvaDM1OVVDSEM2UjRUNVpQZFpiQ2tDdTBJS1dXd3JH?=
 =?utf-8?B?bXc9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 599a0097-580d-439f-f9f9-08de1ac4b51d
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2025 10:35:29.4683
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vgZYZbICYlTpt5aZJXQddj9rN4FT/bcH4/JP1MB2s4KgZX5Ujuwi6iycDF2wJsRhQ1hHt+76Pir5sqL/ZFVcbMQN1ZQDKNa0F+D0XfiN3Nk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8716
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 03 Nov 2025 10:35:39 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7967

Hi Robert,

On 11/1/25 7:45 PM, Robert P. J. Day via lists.yoctoproject.org wrote:
> 
> here:
> 
> https://docs.yoctoproject.org/dev-manual/temporary-source-code.html#finding-temporary-source-code
> 

I think this needs to be updated as there probably are changes to be 
made related to the introduction of UNPACKDIR and S being automatically 
set to the git subdir if the git fetcher is used (IIRC).

Cheers,
Quentin

