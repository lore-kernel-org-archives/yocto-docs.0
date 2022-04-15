Return-Path: <nabsyed@ebay.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72A35C41535
	for <webhook@archiver.kernel.org>; Mon, 18 Apr 2022 14:25:53 +0000 (UTC)
Received: from esa.hc2186-20.iphmx.com (esa.hc2186-20.iphmx.com
 [216.71.154.29])
 by mx.groups.io with SMTP id smtpd.web12.11579.1650052685320536474
 for <docs@lists.yoctoproject.org>;
 Fri, 15 Apr 2022 12:58:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ebay.com header.s=ebaycorp header.b=d04OByi5;
 spf=pass (domain: ebay.com, ip: 216.71.154.29, mailfrom: nabsyed@ebay.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=ebay.com; i=@ebay.com; q=dns/txt; s=ebaycorp;
  t=1650052685; x=1681588685;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=OF/hyVU0CEcKGqb6PYDfDr9sW3beCXjzgdq73xG4gbw=;
  b=d04OByi5mtx2Y72uFYeiYX5/q7CX0nJY7ZoUgrOhcCInppSUS9s2zIa5
   AelH6wTvnIHCmPWJQv4fW9qVunLgjcEW+RlZDAkLAjvUihTRzcpD9/ESL
   BFr4usKw1zRhb0A13MrJICkAWALTh66rX+Ng+FPv+2LDUtRe9NCEEddRA
   Y=;
X-IronPort-RemoteIP: 216.113.162.88
X-IronPort-MID: 173462554
X-IronPort-Reputation: 5.2
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: Vontu_to_CES_Outbound
X-IronPort-MailFlowPolicy: $Vontu_to_CES_Outbound
X-EBay-Corp: Yes
X-IPAS-Result: =?us-ascii?q?A2EIAAD6zVlimFiicdhaHQEBAQEJARIBBQUBQIFGCAELA?=
 =?us-ascii?q?YInfAKBVoUnh1SFb4MCA5xrFIFdCwsBAQEBAQEBAQEHAiwHEAQBAQMEhH8Ch?=
 =?us-ascii?q?H4mNAkOAQIEAQEBAQMCAwEBAQEBAQMBAQYBAQEBAQcEAgIQAQEBAQEBAQEHD?=
 =?us-ascii?q?QkHBgwFDhAFIoVoDYNTgQgBAQEBAQEBAQEBAQEBAQEBAQEBFgINUmYBAQEBA?=
 =?us-ascii?q?wEQXRcEAgEIEQQBAQEuKAodCAEBBAESCIJ8AZo5gzABAYk0AYdqgjZ4gTOBA?=
 =?us-ascii?q?YIUBIVsA4F1gT0BjlZDgUpDgViCZz6CYwWBKAESASOEC4IMIgSab4FSByYsg?=
 =?us-ascii?q?Rg/B2qSVY8hjBCSdQMHg0mLF4x5iA4VhUOjEJZeIKZKAgQCBAUCDgiBYUpcc?=
 =?us-ascii?q?HAVO4JpCUgZD445iG2FSnU4AgYLAQEDCYxGAQE?=
IronPort-PHdr: A9a23:keQ/OBPaXm8v/chwzWsl6ncAWUAX0o4cdiYZ6Zsi3rRJdKnrv5HvJ
 1fW6vgliljVFZ7a5PRJh6uz0ejgVGUM7IzHvCUEd5pBBBMAgN8dygonBsPNAEbnLfnsOio9G
 skKVFJs83yhd0ZPH8Oralfbszu56jtBcig=
IronPort-Data: A9a23:17ctHqiw0dqf+agDSMwqMdHCX161QhAKZh0ujC45NGQN5FlHY01je
 htvWGCBOfjZYjf3L98ib4jn9UoFuZLTyYRhTFA4qCg0FCNjpJueD7x1DKtS0wC6dZSfER09v
 63yTvGacajYm1eF/k/F3oDJ9CU6jefRLlbFILas1hpZHWeIcw98z0M78wIFqtQw24LhX1rQ4
 YmaT/D3YTdJ5RYlagr41Ire8HuDjNyq0N/PlgVjDRzjlAa2e0g9VPrzF4noR5fLatU88tqBe
 gr25OrRElU1XvsaIojNfr7TKiXmS1NJVOSEoiI+t6OK2nCuqsGuu0qS2TV1hUp/0l20c95NJ
 Npl64y9dAkpJPD23/UyTjBZTipTZIB+9+qSSZS/mZT7I0zuaH/nhvR2BV0xOMhAorwxCmZU7
 boVIjkcKBuEgopawprhE7cq3514apC1ZsVP6hmMzhmAZRoiaZbKSb7b6NNw0T05l4ZFGvO2i
 88xMGU0MEqaPkATUrsRIIwAxdaHglLdSTB/jFWVvYsr/EzN3gMkhdABN/KOIY3QG625hH2wq
 mXN5Ez9AwoGL5qOzjGZ9Wq2ge3Clj+9X5gdfIBU7dZunkbWymgLDwAKX1ymp/X/gUmkQ5RSI
 UUFvCEpqMDe6XBHUPGjTxCFrn6e4yRbSvVNOuxn4yzU55LbtlPx6nc/chZNb9kvtckTTDMs1
 0OUk96BOQGDoIF5WlrBrurL82va1Tw9aDZbPH9bHVRtD8zL/dlr5i8jWOqPB0JcYjfdIjj2z
 yHiQMMW1+lL0pZjO0lWADn6b9+EoobSCwIx/gLKQmii8wV1IoWifZTu5FLS/LBLK4Pxori9U
 Josxpn2AAMmV8rleMmxrAMlR+/BCxGta2O0vLKXN8N9nwlBAlb6FWyq3BlwJV1yLuEPciLzb
 UnYtGt5vcEPbSvzPPApPd7tWqzGKJQM8/y6DJg4ifIRPvBMmPOvp0mCmGbLhzGyziDAb4ljZ
 M/znTmQ4YYyUv82lmTeqxY13LUi10gDKZD7GvjGI+Cc+ePGPha9EO5dWHPXN7xRxP7a/G39r
 ogOX+PXmk03eLCvOUH/rN9MRXhUdiJTLc6t9KRqmhurf1AO9JcJUaGBmNvMuuVNwsxoqws/1
 ijkBBQJmQal2CWvxMfjQikLVY4DlK1X9RoTVRHA937zghDPva7HAH8jSqYK
IronPort-HdrOrdr: A9a23:p8vz96sOq1Ib06pGrznodiuT7skCKoAji2hC6mlwRA09TyXGra
 6TdaUguiMc1gx8ZJh5o6H7BEDyewKgyXcT2/hdAV7CZnithILGFvAF0WKP+UyCJ8S6zJ8n6U
 4CSdkzNDSTNykCsS+S2mDRfrdB/DDEytHRuQ609QYJcegeUdAG0+4PMHf+LqQZfnglObMJUL
 KgwO4vnVGdUEVSROu6A2QIRIH41oT2vaOjQQUBACcg8xTLsCi18qOSKXKl9yZbdwkK7aYp8G
 DDnQC8zL6kqeuHxhjV0HKWx4hKmfP6o+EzSvCku4wwEHHBmwyobINuV/mppzYuutyi714sjZ
 3lvwogBcJu8HncF1vF4CcFmjOQkArG2UWSi2NwskGT5PARgwhKT/apsLgpMScxLXBQ++2Unp
 g7mV5x/KAncS8o1B6NmOQgESsa2XZc6EBS79I7njhRV5ATZ6RWqpFa9ERJEI0YFCa/84w/Fv
 JyZfusrcq+XGnqGEwxhFMftuBEn05DbCuuUwwHoIiYwjJWlHd2ww8Rw9EehG4J8NY4R4Nf7+
 rJP6x0nPUWJ/VmJp5VFaMEW4+6G2bNSRXDPCabJknmDrgOPzbIp4Ts6Ls46em2cNgDzYc0mp
 7GTFRE3FRCM37GGImLxtlG4xrNSGKyUXDkzdxf/YFwvvnmSL/iIUS4OSQTegub0oAi6+HgKo
 aO0chtco7exEPVaPV04zE=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="5.90,263,1643702400";
   d="scan'208";a="173462554"
Received: from lvs-dlpoutbound.corp.ebay.com (HELO
 slc-ipatom-002.corp.ebay.com) ([216.113.162.88])
  by esa3.hc2186-20.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Apr 2022 12:57:50 -0700
X-ATOM: Processed_By_ATOM
X-IronPort-Trust: True
Received: from mail-dm6nam08lp2041.outbound.protection.outlook.com (HELO
 NAM04-DM6-obe.outbound.protection.outlook.com) ([104.47.73.41])
  by atom.corp.ebay.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Apr 2022 13:57:49 -0600
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SDRaxlDYGs0zwkS+D7MKCYRVie4sZmiHvlBIaaDmlgJ5Pg+RUaDmSDh2MAiwZ7evQY2zXSujoPYMGM/gqfoZDOpO2bOeNPQkThLsk3hNU4U/jRME8o2TLpupkPIUsP3Zovf7AnmiABEE8MNE2Iwr4+2WgIXitMVXO4oaJidcf3399/2gjVdo1bwEbavKvMTRwqTkx0FssZhOyPJe5KfEzBcrx71F5z1j4SZP6wejACTszio4xgErK4B+gC2NnQ/HqlBC4/6HI0GzNO1ncqcZeB2yehLTZAFLpaSrSFdE8z1riXzspnaUDwA5v70riYwM7guEnsyKoHHlsERiO6Mjkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OF/hyVU0CEcKGqb6PYDfDr9sW3beCXjzgdq73xG4gbw=;
 b=kwVdny8gEBy+caZFCNcTzEPx/nmV3fpWqgNSpQx0MJC3oPTMN1U39SfO5s5yV+8LjmMeW+EC7rNd2I1LUZGX5q4wRrhptG8LMQ3qYLUOWazAQn1z8GiIYSc+gl1Zcyw90KHGlf3UMZP4IT5Yzl6o8SU8E8bfQKsRAjPUyefWeV/HtbNYcZMNWDp7yf1LHEYHgvx8EPOqinh9Z2e7sjjBTpfuS4jUsbPvkKJo6rd5eBvX9qxmBtsk5hGMbhfg9B483ayRmuqQbDzVkbxbckhYJv/tW5xkp8CsfxpWrc5ZOuGnJeflwxbv6liVmEQjv7uvxv2FUWDVkzVzZRYrGzGe4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=ebay.com; dmarc=pass action=none header.from=ebay.com;
 dkim=pass header.d=ebay.com; arc=none
Received: from BY5PR07MB7251.namprd07.prod.outlook.com (2603:10b6:a03:20f::17)
 by SN6PR07MB5599.namprd07.prod.outlook.com (2603:10b6:805:eb::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5164.18; Fri, 15 Apr
 2022 19:57:47 +0000
Received: from BY5PR07MB7251.namprd07.prod.outlook.com
 ([fe80::29d8:1ec9:ccbf:e53c]) by BY5PR07MB7251.namprd07.prod.outlook.com
 ([fe80::29d8:1ec9:ccbf:e53c%5]) with mapi id 15.20.5164.020; Fri, 15 Apr 2022
 19:57:46 +0000
From: "Syed, Nabeel" <nabsyed@ebay.com>
To: Michael Opdenacker <michael.opdenacker@bootlin.com>,
	"docs@lists.yoctoproject.org" <docs@lists.yoctoproject.org>
Subject: RE: [docs] IPv6 Autogeneration Not Persisting
Thread-Topic: [docs] IPv6 Autogeneration Not Persisting
Thread-Index: AdhQ+oxJbHnb8GYUR5GvS3X9IklhGgABKdQAAADypkA=
Date: Fri, 15 Apr 2022 19:57:46 +0000
Message-ID: 
 <BY5PR07MB7251DBEC82BFA2A901D2FCA7CCEE9@BY5PR07MB7251.namprd07.prod.outlook.com>
References: 
 <BY5PR07MB7251BEE4347F7AD55ED1B328CCEE9@BY5PR07MB7251.namprd07.prod.outlook.com>
 <5adc487b-faa5-acc8-29f0-850e0067a604@bootlin.com>
In-Reply-To: <5adc487b-faa5-acc8-29f0-850e0067a604@bootlin.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=ebay.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 891dfa12-5c06-43a0-9bb0-08da1f1a3678
x-ms-traffictypediagnostic: SN6PR07MB5599:EE_
x-microsoft-antispam-prvs: 
 <SN6PR07MB5599029EB69A40837D2F1B32CCEE9@SN6PR07MB5599.namprd07.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 Zx4cmA/yfSBNpsoq8F2ZHUFHG4BXzNyUAwU8ow8q4zHfrkbFeaIuHydNWRtSsZaJYJR2SuQWZd7VbzwimFV1/7Nw4nVerU2qPfqMaitferV1veHaQW9uebY85DbMV+XdmPVgVCPq7So7LG/O04/ONmSgcA7GueqlKOPyRwEWNERbrCUKKuYhAhc4euR4iC87VtPw2srmds6ifGeV6L0J7t4lpL33HxY2nzt6TqiA9HquJUmVKNSHX7Qv0Yrfpen+y+4rg0dIQXJXISWYiZrGZcRzL+h1yrk79nk8pioQLl3Hfgojd6olMh6R3Bw1sG74CMPFt53didzdQsFkzzH9SfedTGzVsT0BMm4Dmq8qwPG6cLLU9ODpm29ActwGxNCFPNJsH9C7NsqC66yEL9DfBVwHHbjoDKQ934SrIbQKFwBcGLDV2DiipMPo+MknN3U0dvCwLOaH5PL1N1pWLvVCHH26vJar3qHhX6OOhgNHw0pXNrlAyKqZvG3IL4FY4W6FHngiYnqEQjXmJEbEvr44UwckgKhVtLcxOL8uHtnyTishc7dXuZRCD8U08nIsGDHXdz18FLFtO9ghRNjBY2Tyg7ZKkVR1Bz6Jejz5s2T1oW96ML8w8DQgiG0jFh8x6GSCnugtLLsGrZWQurgMFKYGT8SIVp0t026I2xFLEE924TNIIQd0NJhP9GOaGJTZvuXdQMORubNPD29ZxajgyHn+/RohyvSsH8GUYb0sCireD5IuYh9fXp1QGCPFgvI7E737Nl9XxfRNtlzl7PrRr0rB3v9Mr6PzuLSSZhdeUo4IHxw=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR07MB7251.namprd07.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(966005)(64756008)(66556008)(7696005)(6506007)(66476007)(71200400001)(8676002)(9686003)(508600001)(110136005)(10290500003)(55016003)(76116006)(53546011)(86362001)(45080400002)(38070700005)(66446008)(66946007)(83380400001)(316002)(82960400001)(5660300002)(8936002)(26005)(38100700002)(52536014)(33656002)(2906002)(122000001)(186003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?8/i561N/aMg9fmWTctcJ43FqhHURvilnZdYXaNUCAzTLujRuHDN/CZ04Rj?=
 =?iso-8859-1?Q?fFlbM1BSbBIW/ibN0pAdh6JZBOqx+SwfZAp64rID5VdOxMMYwQvZ8429fC?=
 =?iso-8859-1?Q?Pf91GgO6PeINwM2zOnYVOFnesr5SH11uZn7WuBqtkAjN7bPMec5J/iZtu5?=
 =?iso-8859-1?Q?osRLH4spTwM0hRn8P0pIRQLgm9nbzQ4sgcQdpRl8eBcO2r4xs5w799A/NE?=
 =?iso-8859-1?Q?ZqaTb9JKleKzDBE4MlhXZGcdev80ji3kAkpX39aOAG78h77HAOrINUB80y?=
 =?iso-8859-1?Q?BzhIwkk5Kkf7wgI8ZSjQQOvUyJIrBjHNnY9UufXChpD8CP/tQwfq8acnKd?=
 =?iso-8859-1?Q?pO6nqsYc3rVAhoggx5uhGNp1I7Z7JlVjKbBoSVc0yUfDZCF5oQ3heJ7fL+?=
 =?iso-8859-1?Q?ZzvyBvcylNajnzNS38xKhb4Kb9WGD/kZl7ustvyD/HsSiN67B+Q/R4XWzd?=
 =?iso-8859-1?Q?EGBjgChcCZQKetQMsN50s7j0mnQo7B1LHiVkr54FJq0glEhSumpugBJNrQ?=
 =?iso-8859-1?Q?5TC2d82yWgL/CVWlr9a1GJGdWVVYUfxd6z12o+Wg+tptqoD8Jt+1eJG6Es?=
 =?iso-8859-1?Q?QSRwZXrr6w6nvp1agF+VFZqzsLlOzammEcq7NBPIsBMIx5Lv8aswMR/Nug?=
 =?iso-8859-1?Q?XLAdWvaE1wtCnT69inapHaOSYH0lS47DB/34ikcsJwkxZXwPA67iKeMUZ9?=
 =?iso-8859-1?Q?zkYKmOxUC+wRmFTSIoqiZjrEHREzCJQoyoEA1tuWslZzJ3qOeqSWb/vYdz?=
 =?iso-8859-1?Q?A32FRjE18YA4F13Z0DApD5JE0/oNKdZr6ToD61cqmLeCURagOdzLCrNCQP?=
 =?iso-8859-1?Q?FYO3WqOnOW0RrBWZSq3+2A+r8WB0H0ur1cBPWlmb5QZjGhm3F75eUm9X8o?=
 =?iso-8859-1?Q?n84azqV2HVM9EqKxEHpvSM7GcrIc0nYuWWTv/CqT8IKndmCUzjDf25q24x?=
 =?iso-8859-1?Q?LkQ4lvjIzLkjS0IXnmYM5EP3zcE9gV5D8UamFzLyvhfZoBPAHwsysJchQS?=
 =?iso-8859-1?Q?laE+dPYgRRZVayBOtqdejlNWNtTLkhkqTLPbo7SgGVsITsa6dwLynOhthx?=
 =?iso-8859-1?Q?JaMg56Z5xVT2tWzhdzwG4JuuvqJdFde8THH7sFameeuVWES1aM0oS4T39L?=
 =?iso-8859-1?Q?ChGxqwViHD92RRVeSFxaxVGaD3b0/slF61z/ZWakKfU/heg7rsFPrNBWOd?=
 =?iso-8859-1?Q?9NVNXmtBQ93HDVQPHuhEI2eQqikolV4XzxPpCRi8cDgrY756gzRH+FOMG8?=
 =?iso-8859-1?Q?liejFjmW3k4ohhJLCiVALTf9b8XBjijVc2nWXcNi0mQn9vo9zNY3A6+1LK?=
 =?iso-8859-1?Q?+RuojBNOwwnx3GDhJYFKAozj5zXqEpCQHsqTLVmy1ERRASTITeIJFdUgAF?=
 =?iso-8859-1?Q?FkOYTCPGMjY9lL8+AZdj2Wa9WnRAYB1lXhpWTp9+qkfxdeaRw8bJXw/ggf?=
 =?iso-8859-1?Q?COtnISCA2iJrMtEKYyGW6qCPLTcZbp2xbqxHpDcsA8uONLRqXPVIl7FkqP?=
 =?iso-8859-1?Q?LXAXJaI4ktsdrdu7eZ1kTnpqjr9wUcSrUA+/QKNCHo74RE4mcwhoAMlf5E?=
 =?iso-8859-1?Q?GrpBTTuiBj3uLhj1CPbTpmyycwArSFBDhSIz4jdGaNCr2Lv8g+cXXHJq+x?=
 =?iso-8859-1?Q?nUJ81bZXRH4OPx61PY/WgocBBMc5QJFmXFj6awBjZHC32IBNwQLQ8qFFx0?=
 =?iso-8859-1?Q?iEJBVjxZnAbyI2QaeLEpPnGKV3VRVHmVg5dCjPii+fICu33wPxfK6tLPpd?=
 =?iso-8859-1?Q?oIxm84qaBIL/w5+Vop+hadlkuBTHBkX8yzVA51jC9N+KNLhMQqdFSMyITT?=
 =?iso-8859-1?Q?ovQcnFlqtg=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: ebay.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BY5PR07MB7251.namprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 891dfa12-5c06-43a0-9bb0-08da1f1a3678
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Apr 2022 19:57:46.9518
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46326bff-9928-41a0-baca-17c16c94ea99
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 
 sagayUJs4Z+GGwUvVIsP3vgBux7KpLOCg1kIxqobRbQpxHY162m4pnQxEdPEcXVmOKhaEruryYdwp48Ckairkg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR07MB5599
X-CFilter: Scanned lvs4
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 18 Apr 2022 14:25:53 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2783

Thanks Michael.

Nabeel

-----Original Message-----
From: Michael Opdenacker <michael.opdenacker@bootlin.com>=20
Sent: Friday, April 15, 2022 12:30 PM
To: Syed, Nabeel <nabsyed@ebay.com>; docs@lists.yoctoproject.org
Subject: Re: [docs] IPv6 Autogeneration Not Persisting

External Email

Hi Nabeel,

On 4/15/22 20:59, Syed, Nabeel via lists.yoctoproject.org wrote:
>
> I'm trying to auto-generate IPv6 for interfaces on a ZPE Systems=20
> device but not able to. It keeps reverting to a value of '1' after a=20
> reboot even though the config file clearly has '3'. Anyone run into=20
> something similar?
>
> =A0
>
> =A0
>
> root@device:/home/admin# cat /proc/version
>
> Linux version 5.4.137-yocto-standard (oe-user@oe-host) (gcc version
> 9.3.0 (GCC)) #1 SMP PREEMPT Sat Jul 31 06:19:39 UTC 2021
>
> =A0
>
> root@device:/home/admin# sysctl net.ipv6.conf.sfp0.addr_gen_mode
>
> net.ipv6.conf.sfp0.addr_gen_mode =3D 1
>
> =A0
>
> root@device:/home/admin# cat /etc/sysctl.conf | grep=20
> net.ipv6.conf.sfp0.addr_gen_mode
>
> net.ipv6.conf.sfp0.addr_gen_mode=3D3
>

That's a question that should typically asked on the "yocto" mailing list (=
https://nam10.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Flists.y=
octoproject.org%2Fg%2Fyocto&amp;data=3D04%7C01%7Cnabsyed%40ebay.com%7Ce082d=
18e2d834c2245a508da1f16598e%7C46326bff992841a0baca17c16c94ea99%7C0%7C0%7C63=
7856478699978673%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMz=
IiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000&amp;sdata=3Dlq%2FBV21z3n744IDr6Dq%2=
FVy2a3wKkVvA2LqhRnAQu0C8%3D&amp;reserved=3D0).
Cheers
Michael.

--=20

Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://nam10.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fbootlin=
.com%2F&amp;data=3D04%7C01%7Cnabsyed%40ebay.com%7Ce082d18e2d834c2245a508da1=
f16598e%7C46326bff992841a0baca17c16c94ea99%7C0%7C0%7C637856478699978673%7CU=
nknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLC=
JXVCI6Mn0%3D%7C3000&amp;sdata=3D61mbUJ%2FpcAWO%2FmjVbshXqejLyED%2FprRXciyRP=
5o8cBc%3D&amp;reserved=3D0


