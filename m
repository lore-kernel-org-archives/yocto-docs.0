Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 342EBCCF9EA
	for <webhook@archiver.kernel.org>; Mon, 27 Oct 2025 13:17:35 +0000 (UTC)
Received: from MRWPR03CU001.outbound.protection.outlook.com (MRWPR03CU001.outbound.protection.outlook.com [40.107.130.71])
 by mx.groups.io with SMTP id smtpd.web11.32388.1761571053110505627
 for <docs@lists.yoctoproject.org>;
 Mon, 27 Oct 2025 06:17:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=PbMdn2bq;
 spf=pass (domain: cherry.de, ip: 40.107.130.71, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZP5SpRD8Ze9XdF7wwCuVAMA9G8OeWpO6jFPagIPwEBdwOM6QnKFedvZ4etHr3b+DiOtTszLPgRScDXah9TuX4YlWf/zIn/mGBB59IqD412x8KPtvrmuOG6zdbVGMAk07SDuyqiKEpiyUa7iu//AXBMBYCqx+wJtQ0VEZXww/abHLCdu2c8Z0vdUCbSKMk2j60MDeTu6n8rkCtHAIKkLio5Yd+KMOl2oUzuCVX7Sz3Em629IIBoCF/eYVMQiuLhQtqmi0kn4qQm+pawQDbmuSxUYf6CZHvxx2UZYwES9MReyqtXgP+rw3lvtVcmfFhyYHvzid7YHB96pdJw7Stz8zwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sfTvKAl8Z5i60E9urYoooUR8tlBpkkDqSY8kY3+qyUw=;
 b=DM1jboEaExYn0UsgqeXhgtWYa3jult4KRNCBfmPsCGgPlAfEi5QuxUtjWx+jLs6s7B8GB4J663571wEXkdxoz4rQK17kvfUFTofSnPBsL6H0RD28fSpwRSY6h/3inzyaftG8CfMburS6jObVmB7Cb9lN8tOJ/jVrOa13Nnr/7c/b4sN5WHRxG7fAfL7kmW88jZ1piis4EallxJMFEzpuzhpcnJofSoWxAzAN79XQGIdidv2tenJ9WSPCqkFa26H49M+XrOyKLcT8rwtTvqFc2mcJuc3LsAUwrPJOSVrz/oZXu3/kHCt13Jw2/UbMAKHokaj12LILecnjqdfyVe3oyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sfTvKAl8Z5i60E9urYoooUR8tlBpkkDqSY8kY3+qyUw=;
 b=PbMdn2bqYiQFLhXN1ZyemYRY2oop+gi+WUA0UcYW4bfbOlhZ2cOpE9UeXEKdiGM1hPv4VZZhceso3pYjTl+NBSRHnrwnt1Gj0F8rKn8M6ExrXExWrCx1GkCcJR68drmxZ3kL+lJ8HuwaiLP/wh1KQCtGA+Yc96io9MyfjhKqV2Y=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by PAXPR04MB8605.eurprd04.prod.outlook.com (2603:10a6:102:218::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.18; Mon, 27 Oct
 2025 13:17:29 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::5ee:7297:93b4:a8d1]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::5ee:7297:93b4:a8d1%6]) with mapi id 15.20.9253.017; Mon, 27 Oct 2025
 13:17:29 +0000
Message-ID: <793bbf0b-3686-4029-9d4d-a0ee0cc67c2d@cherry.de>
Date: Mon, 27 Oct 2025 14:17:28 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH v3 16/16] migration-guides/release-notes-5.3:
 updates
To: antonin.godard@bootlin.com, docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20251027-release-note-5-3-second-hunk-v3-0-07d36e2380b8@bootlin.com>
 <20251027-release-note-5-3-second-hunk-v3-16-07d36e2380b8@bootlin.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20251027-release-note-5-3-second-hunk-v3-16-07d36e2380b8@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0151.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ba::17) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|PAXPR04MB8605:EE_
X-MS-Office365-Filtering-Correlation-Id: 394e5b50-8dbf-4abc-8f47-08de155b2e0a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?SC9aWVZ1cW9oTHFMTWFsSDlVVGQ0V3M4WDh3dGxyOHFTVFJyK3hGREFhL1h4?=
 =?utf-8?B?L1FiM1V4Sk5PazZvRmEydGFQR2REOThWZjB1VnR0RDNmdFBLeC9yUUcycGlq?=
 =?utf-8?B?Q1JRSWNnK2tEd3d6VmkwUFYvcHBUVmVYbE5zc2FYSHdQbm93Wkt5WUQyOW5U?=
 =?utf-8?B?MXB6S0pWczQ5b0ZsbFFNQ0o3WXBKVlErZVlFS2dWUXNQNkZ0MFdjeUQ3bm9r?=
 =?utf-8?B?NnFkZjNTaGJHYWpCRFlMRjNNVmRmRnRnYm5vRGZNWEw1VmNtRkIvcWxYdEZz?=
 =?utf-8?B?OThSZmZrNld1TDVReC9TUVgrQ2xhc2M2SVBXd2NzS0txTHJoRVA3YTZMLzlI?=
 =?utf-8?B?ak9UR0tpNUtEWTNDbCszU0k2RnFjVFk1ejB3VTY2L2V3VW13MHNRckJjSWxE?=
 =?utf-8?B?SThiK1NJcjEzaUdVaXdqUUVSNk1yenJCS3h0Tzh1TS9jRlltRTh1R0lqRzVU?=
 =?utf-8?B?RlptdUdmNHplQVBRM3hsNmYxR0dZd25PUnFZVXpraUVRcHM1cGF5Y050cTYz?=
 =?utf-8?B?YlZpRDBpSk9kOERFekl4S3l0TDg2bHpGWFd3TGlsYkVZNHNhNFRtc1hUakw1?=
 =?utf-8?B?QitscndzMGdUQWdnSk1kU3NzTnNsb1Z5dklDTkdDSHp1YVFCM0VIa0dsOG91?=
 =?utf-8?B?RzRMTElXZTNxUXFTSkZ1VUNvR2ZGcnZqYmlwS0txSHRwM2lTaEplUFFodWJ2?=
 =?utf-8?B?djkvRzF4OUN0dWdzRVRvTVozRUk5VE50cjYyRDVPbUYxdlE5aysxRXJsOW9t?=
 =?utf-8?B?QkZzS0gvYjVZL2lrdElUZjZ2SEIyL2Z2R1VGSzBNRWJJQ1VCaWlyanBidi9D?=
 =?utf-8?B?a3hIWG5FUHVxL3FjWk5aU1g0T3B4WnVNci9ZVktHZVZEZU1wenB2dEdML0FZ?=
 =?utf-8?B?VEttNHRpbFM5TU1HdDZCVUpJNUhCUGRVOHFjMEd3OWs1TDIwZUFkeWcxRDhY?=
 =?utf-8?B?UUNpOC9WckJhL0h4TjdSNmxWMmdGZlFNdi96NXVoUzRHV254VDBhbzZ0VzRL?=
 =?utf-8?B?VTN2YkF0R3pmWnUvNVNreVZvU0lXUGhZb0Nlb0ZGOHh1TFMyVlEzZXl2VllG?=
 =?utf-8?B?TUxJblBHUHBtaHBMSFJiV0xVSFJpMC9HSmROb1lyaTF6ZzRlaUJ0ZkUyKzRS?=
 =?utf-8?B?dzhNUVFaMUxIY0VtY2FxaWpzU1FmK3Y5aFZ5QXNUb2liMUp4elVCTFRDK0l4?=
 =?utf-8?B?QlFFNkpXK2h5WnhUZmdCYUpuZkxBdU1QRnVPcXlJWnAwZ2V5VThQQnZKcklC?=
 =?utf-8?B?RmNWT2ZVaFY0dXUyd25nZjE5OE9xaXhTVEcyNUVOdHAwOXF2TEtuTzBHbXJr?=
 =?utf-8?B?NDVBR2J3ODVuT0R5czdKdUIwVFNMWUdLVjZEODUrcndGbXl2Uzk0dk5DalRs?=
 =?utf-8?B?d3FDTnJzdXE4OVBNbTlYVFJiLzludnN6SnhrZ3gzR1ZRYy91MDZPT3RsVzhz?=
 =?utf-8?B?SUxNZVdQMmJsNDV4M2pQSGdSRmxKcnByU1lhY0k4OFFXUVZnR0xVWDVibmg3?=
 =?utf-8?B?SHlhbzkvMVo3amJWRyt5TVZveVFwcXl1OUtMQko1ZzdremFlNXc2eHY3QXRF?=
 =?utf-8?B?WE5ZVmtuQjQvQ0dGN2NJeXRHUWp2TmZtekRlNXdtakU0dWt3RGhrdk9laXVO?=
 =?utf-8?B?U0dvTThub1Uva1Roa1Ayam83TGVIT0ZTZ3g3R1lhcWNuWDN1MGtST3ZqM2Jv?=
 =?utf-8?B?dUlhdXhWMmZmMUZzVkN2eUVMN09RdlgxcVB5WFNvSHRadkVtNXVVUmgwSzNk?=
 =?utf-8?B?SldaNml1VjErMlRSdm40RnNGRTNpYzYyTmxqd1FneEdZb2F3NWN0bGdER1Nk?=
 =?utf-8?B?aGgyYnc1Ym4xd0M1cGF5S284NkZGdVJrQzYzWklVWmV6RVVnZDQyMFI5eVNU?=
 =?utf-8?B?MGhpRGZYOVB5TXpBVzhCTGU1SmxZWlhXclpWV3kyZGY5K2lyMWtWVmx6dVNQ?=
 =?utf-8?Q?mVQs3lOqgB9+hFg17O42h/MZPTP3skZs?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8897.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?Y2lESHQ3NmJsQkgvVWZTT0dBZkNKYnl1dGRzY0hJbmIySTFkRzQ5NmorT0oy?=
 =?utf-8?B?a01leW1zSy9LNWNNTy9sdFFOVTJOeEVkRWFjQjU4QWZhdVl2Ris2K2JwNEpm?=
 =?utf-8?B?WE8zck0vQmZrRWxkaUR2N1BjSUlhWjdYZHRWQjZObEt1WFhDMy9aZTh1OHA5?=
 =?utf-8?B?VEZiOHJjQTZQR2JPK2REYjc0blVBbDZQcjllbmxIQ3YyT0JKcFRhdkJOVE52?=
 =?utf-8?B?c1d2ZkhUaXZCbGV6YUFvblNNK1E0SG1kMnUwbjJXdkdRNVV1TXdnQ3BoeW9T?=
 =?utf-8?B?MDQzOHRnNGZEY0FSbEtlMkFGY1RBM3pZc1duTjhRaFVGZlYwZ2U4MWhpSW5C?=
 =?utf-8?B?UVNoZTh1cHd4UXZVUzN5UDRxcVFhSG10UjlvSlUvTHNCRllROVlYSklLK213?=
 =?utf-8?B?ajdnMjhQYWQ1QmNVSFBQMGl0N3QySFk1eVJZRHRTSVVzN1lEamUvMFVHWHZB?=
 =?utf-8?B?OTBWZ1ZHb0FQck1xZXJ6bjFnR2REYjZWNTRZUjZEaUphOW54cGh3dmUxWjNn?=
 =?utf-8?B?bmJNbjRuMDYwVGZSSnZRK0FDcG9qOXkvLzIreEFRTmJ5T2xrcjBBMUhZV01m?=
 =?utf-8?B?OUZNenJMVXd6eVU3ak5jZGtGbnJTOE14MVR6cktlTm16ejBNeEU0U1d3amRV?=
 =?utf-8?B?aStpNTV4MWlmZnZZRks5WENYMFJFNVJlV0dEWUtiYVhJbVMzVUVmRGhGQkFu?=
 =?utf-8?B?RFJBZVVIYmRqV0RLTEU3ZFN2US9yOFZSa1l4ZzFSZytKcWNHRitLRjFVKzV6?=
 =?utf-8?B?aHBaVTFYb2o2dnNiTDVKeGkxcWlkN2JjNG0vZjVxNy9LTE9lZkdjM25HNUti?=
 =?utf-8?B?VTA1ZDVWSGFxTnA4NFBvR25UTTJhaFhoWmNUaStvamxZdzRjTUttdGptZ0Rl?=
 =?utf-8?B?RG10azhHczRabFVBaTFnSk4xODMrVEZtSW5IRUFUdFVyQklIQTFITC9vTEVT?=
 =?utf-8?B?NDNHRzZ5OC94SW5UMGFiTm1VNlYvYzlUQkdtSEJBU0MxOGxQbmhDR3BSWEhU?=
 =?utf-8?B?R2s3SE9ZUTg2eGdURkN3SlJqMnBTQVNENEdLaFloanBDNWx0YjdkNjY5d1F6?=
 =?utf-8?B?YmxJRUhQTHhqZW1PTXBNbTBVbFJ5eXhnM2xVaVc3K2F4QVRSZHRUQ3R1K3lE?=
 =?utf-8?B?QlFIWlhyUHNsMjlQV2xvTU92ZzJ1aVFZMjhpNVdCaGJpbWZtZVVtVHB2dnNJ?=
 =?utf-8?B?NXk0ZnhiK091dEEyRFdlV2tBejV4SFNCMjg5em5ma1d3S2dsVmM1YUhkUW54?=
 =?utf-8?B?MFBuSXFmVlpCMk5kU3BBNmN3M2FTYkxKZzF1SHlYV0g5OUdNVm5yRkRKV2tN?=
 =?utf-8?B?bVg4cWRWYUZhcEltOHlxaWM1Z1Z5OFhsWnBoNFlodGJ3V1JDRDVONjBDWWQx?=
 =?utf-8?B?RjB5eW9xN3ViUVN6YUVpczhNMFZ6VkFpSlZUQUptb3Mwa01oNU80TlI3Z1Bs?=
 =?utf-8?B?UlMyZE5Da0tIMXd1cXVPNk5CWjNqdGJjTGo5d0t4TlI3bUNieGt0emh0T3d2?=
 =?utf-8?B?R1BxL25iekJnLzRnUjc1K08waGRHNThoMFRlY09meXRQeG5RY2FVQnFuSy9B?=
 =?utf-8?B?ZkszM1FVekRvdlZaOGxZNXBLYjZMR29GZGhDQ0gxOHdYKzVpVDRtUUJXVnJK?=
 =?utf-8?B?ajBsQnNWazQvaEprMGFxeS8rMzhZWmg3eDZmNHl5YkpxVDI0TkpLV05LSnRj?=
 =?utf-8?B?aG50ODhWM3pJMGQ3TmtvM0NuOGpRVFQzK29hQTVFRmxzb1NCSkVhUi9Ca21U?=
 =?utf-8?B?cDViT2FQNzFPTnptNUg2RGl0MjFWanA4MFdVK2hreWdGeEJqdWltWnlyMUxR?=
 =?utf-8?B?c1B0WDYxbkNwd28yTWNNNFRod3pWenRmWUJQWmRxOXRZYWNTQ3ROcnU5cEhS?=
 =?utf-8?B?Q3RzZ3JWaXF1eThYRktGb3duQS84bzBlQ3NSelhERG5iWVZhcmFWVmM4V1RJ?=
 =?utf-8?B?c1JVb2x0Z1gwTWJEMjhaR0k4cldtTVNtVzFKbFB6aGtKcXlNd3RqZDNNVy9r?=
 =?utf-8?B?bC9JMFRPdXRxUGI3eGtkTFdZZkVPMHVlQTJLN2x4dWJtZWovbEo5TmNYckdw?=
 =?utf-8?B?RkNVRkpTbnZIdU00Zzc0RGF3YkFpV0FaUHhXSEFBRGkvckU5VVhjQnhVMlpL?=
 =?utf-8?B?R0luMkw1c01DRnc1V3hOR2VGYWNFQ3dtVzFjM2pFWFE5OUdKTmV5cEhzYkhz?=
 =?utf-8?B?cmc9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 394e5b50-8dbf-4abc-8f47-08de155b2e0a
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Oct 2025 13:17:29.3242
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0Box3imlSbAC9apEHMHnY+E2r6PeEIJJ1Mz4Z8YHQW1cL7eQEmgsh1q5qILHz7deqLVlvqd0K3c4iIQKFZ9E8b9TXj+CYgHk4Nz1fkPkOnc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8605
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 27 Oct 2025 13:17:35 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7872

Hi Antonin

On 10/27/25 1:43 PM, Antonin Godard via lists.yoctoproject.org wrote:
> Update the release notes and migration manual for 5.3.
> 
> This covers commits from bd4625cd4db0 ("build-appliance-image: Update to
> master head revision") to 4a1f38dd8db1 ("bitbake: knotty, uihelper:
> Remove running_pids and lastpids") in Poky.
> 

Looks fine to me, we can always patch things up once merged in the worst 
case, so

Acked-by: Quentin Schulz <quentin.schulz@cherry.de>

Thanks!
Quentin

